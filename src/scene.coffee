class MainScene extends Scene
    constructor: ->
        super
        @stateManager = new StateManager( new ReadyState() )

    setup: ->
        #topaz = new Sprite(64, 64)
        #topaz.image = Puzzlelele.game.assets['resources/images/topaz.png']
        #topaz.moveTo( 64, 0 )
        #Puzzlelele.game.rootScene.addChild(topaz)
        @field = new Field()
        @field.onEnter()
    update: ->
