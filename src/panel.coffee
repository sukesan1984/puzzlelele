class Panel extends Sprite
    constructor: ( panelType, position, field )->
        super 64, 64
        @WIDTH = 32
        @HEIGHT = 32
        @type      = panelType
        @setPosition( position )
        @field    = field
        @vy       = 0
        @aimy     = @position.getY()
        @move     = 0
        @passedTime = 0
        @.image   = Puzzlelele.game.assets[ @getImage( @type ) ]
        @.scale( 0.5, 0.5 )
        @removeObserver = new Publisher()
        @willRemoved = 0
    setPosition: ( position )->
        @.moveTo( position.getX(), position.getY() )
        @position = position
        @rectangle = new Rectangle( @position, @WIDTH, @HEIGHT )
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
    onUpdate: ->
        if ( !@move )
            return
        gravity = 0.98
        @vy   = gravity * @.passedTime
        @setPosition( new Position( @x, @y + @vy ) )
        @passedTime += 1
        if ( @aimY < @position.getY() )
            @setPosition( new Position( @x, @aimY ) )
            @passedTime = 0
            @move       = 0
            @field.setMoving( false )

    setAim: ( dy )->
        @move = 1
        @aimY = @y + dy

    addRemoveObserver: ( func )->
        @removeObserver.subscribe( func )
    onRemovePanel: ( rectangle )->
        if ( rectangle.isUpper( @position ) )
            @field.setMoving( true )
            @setAim( @HEIGHT )
    onTouchField: ( position )->
        touchPos = new Position( position.getX() - 16 , position.getY() - 16 )
        if ( @rectangle.contains( touchPos ) )
            ## このパネルがタッチされた。
            @remove()
            @removeObserver.publish( @rectangle )
    remove: ->
        @field.remove( @ )
