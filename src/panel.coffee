class Panel extends Sprite
    constructor: ( panelType, position )->
        super 64, 64
        @type     = panelType
        @position = position
        @.image   = Puzzlelele.game.assets[ @getImage( @type ) ]
        @.scale( 0.5, 0.5 )
        @.moveTo( position.x, position.y )
        @removeObserver = new Array
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
        # 5%で消えてそれが observerに伝わる
        return if parseInt( Math.random() * 100 ) < 99
        @.x += 5
        # 確率で例えば消える
        # 消えたときにObserverに伝える。
        func( @position.x, @position.y ) for func in @removeObserver
    addRemoveObserver: ( func )->
        @removeObserver.push func
    onRemovePanel: ( x, y )->
    onTouchField: ( x, y )->
        if ( @position.x <= x && @position.x + 32 > x && @position.y <= y && @position.y + 32 > y )
            console.log( @ )
            @.moveTo( @.x + 5, @.y + 5 )
        else
            @.x -= 5
            @.y -= 5
