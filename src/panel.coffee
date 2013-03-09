class Panel extends Sprite
    constructor: ( panelType, position, field )->
        super 64, 64
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
    setPosition: ( position )->
        @.moveTo( position.getX(), position.getY() )
        @position = position
        @rectangle = new Rectangle( @position, 32, 32 )

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
        gravity = 9.8
        @vy   = gravity * @.passedTime
        @setPosition( new Position( @x, @y + @vy ) )
        @passedTime += 1/10
        if ( @aimY < @position.getY() )
            @setPosition( new Position( @x, @aimY ) )
            @passedTime = 0
            @move       = 0

    setAim: ( dy )->
        @move = 1
        @aimY = @y + dy

    addRemoveObserver: ( func )->
        @removeObserver.subscribe( func )
    onRemovePanel: ( rectangle )->
        if ( rectangle.isUpper( @position ) )
            @setAim( 32 )
    onTouchField: ( position )->
        touchPos = new Position( position.getX() - 16 , position.getY() - 16 )
        if ( @rectangle.contains( touchPos ) )
            ## このパネルがタッチされた。
            @remove()
            @removeObserver.publish( @rectangle )
    remove: ->
        @field.remove( @ )
