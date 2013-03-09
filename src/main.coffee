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

            @panel      = new Sprite( 64, 64 )
            @panel.image = Puzzlelele.game.assets[ 'resources/images/nebukuro.png' ]
            @panel.moveTo( 20, 20 )
            @.rootScene.addChild(@panel)

            #@.addEventListener( 'enterframe', root.update.bind( root ) )
            @.addEventListener 'enterframe', ->
                @panel.x += 20
                @panel.y += 20
            @pushScene root
        @start()

window.onload = ->
    new Puzzlelele( 320, 320 )
