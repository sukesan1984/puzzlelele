class Panel extends Sprite
    constructor: ( panelType, position, field )->
        super 64, 64
        @type     = panelType
        @position = position
        @field    = field
        @.image   = Puzzlelele.game.assets[ @getImage( @type ) ]
        @.scale( 0.5, 0.5 )
        @.moveTo( position.getX(), position.getY() )
        @removeObserver = new Publisher()
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
    addRemoveObserver: ( func )->
        @removeObserver.subscribe( func )
    onRemovePanel: ( x, y )->
    onTouchField: ( position )->
        touchPos = new Position( @position.getX() + 16, @position.getY() + 16 )
        rectangle = new Rectangle( touchPos, 32, 32 )
        if ( rectangle.isInside( position ) )
            ## このパネルがタッチされた。
            @remove()
            func( @.poition ) for func in @removeObserver
    remove: ->
        @field.remove( @ )
