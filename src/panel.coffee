class Panel extends Sprite
    constructor: ( panelType, position, field )->
        super 64, 64
        @WIDTH = 32
        @HEIGHT = 32
        @type      = panelType
        @rectangle = new Rectangle( position, @WIDTH, @HEIGHT )
        @position  = position
        @updatePosition()
        @field    = field
        @vy       = 0
        @aimy     = @position.getY()
        @move     = 0
        @passedTime = 0
        @.image   = Puzzlelele.game.assets[ @getImage( @type ) ]
        @.scale( 0.5, 0.5 )
        @removeObserver = new Publisher()
        @willRemoved = 0

    updatePosition: ()->
        @.moveTo( @position.getX(), @position.getY() )
        @rectangle.setPosition( @position )
    getType: ->
        return @type

    getIndex: ->
        x = parseInt( @position.getX() / @WIDTH )
        y = parseInt( @position.getY() / @HEIGHT )
        return { x: x, y: y }

    getImage: ( panelType )->
        @PANEL_IMAGE = {
            0: 'resources/images/nebukuro.png'
            , 1: 'resources/images/ruby.png'
            , 2: 'resources/images/topaz.png'
            , 3: 'resources/images/saphire.png'
            , 4: 'resources/images/emerald.png'
        }
        return @PANEL_IMAGE[ panelType ]
    onUpdate: =>
        if ( !@move )
            return
        gravity = 0.98
        @vy   = gravity * @.passedTime
        @position.setY( @y + @vy )
        @passedTime += 1
        if ( @aimY < @position.getY() )
            @position.setY( @aimY )
            @passedTime = 0
            @move       = 0
            @field.setMoved( true )

        @updatePosition( @position )

    setAim: ( dy )->
        @move = 1
        @aimY = @y + dy

    addRemoveObserver: ( func )=>
        @removeObserver.subscribe( func )
    deleteRemoveObserver: ( func )=>
        @removeObserver.unsubscribe( func )
    onRemovePanel: ( rectangle )=>
        if ( rectangle.isUpper( @position ) )
            @field.setMoved( false )
            @setAim( @HEIGHT )
    onTouchField: ( touchPosition )=>
        if ( @rectangle.contains( touchPosition ) )
            ## このパネルがタッチされた。
            @willRemoved = true
            @field.setRemoved( false )
    remove: =>
        return if ( !@willRemoved ) #削除候補でなければ、何もしない。
        @removeObserver.publish( @rectangle )
        @field.remove( @ ) #最後に消す。
