enchant()
class Puzzlelele extends Game
    constructor: ( width, height )->
        super width, height
        @preload [
            'resources/images/nebukuro.png'
            , 'resources/images/topaz.png'
            , 'resources/images/emerald.png'
            , 'resources/images/ruby.png'
            , 'resources/images/saphire.png'
        ]

        @fps = 20
        root = new MainScene()
        Puzzlelele.game = @
        @onload = ->
            root.setup()
            @.addEventListener( 'enterframe', root.update.bind( root ) )
            @pushScene root
        @start()

window.onload = ->
    new Puzzlelele( 320, 320 )
