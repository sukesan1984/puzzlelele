class MainScene extends Scene
    constructor: ->
        super
        @stateManager = new StateManager( new ReadyState() )

    setup: ->
        bear = new Sprite(64, 64)
        bear.image = Puzzlelele.game.assets['resources/images/nebukuro.png']
        Puzzlelele.game.rootScene.addChild(bear)
        bear.frame = [6, 6, 7, 7];   # select sprite frame
    update: ->
