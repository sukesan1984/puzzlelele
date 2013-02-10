enchant()
class Puzzlelele extends Game
    constructor: ( width, height )->
        super width, height
        @preload('resources/images/nebukuro.png')
        @fps = 20
        root = new MainScene()
        Puzzlelele.game = @
        @onload = ->
            root.setup()
            @pushScene root
        @start()

window.onload = ->
    new Puzzlelele( 320, 320 )
