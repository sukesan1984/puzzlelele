class MainScene extends Scene
    constructor: ->
        super
        @stateManager = new StateManager( new ReadyState() )

    setup: ->
        @field = new Field()
        @field.onEnter()
        @field.addFieldObserver () => 
            console.log( "hoge" )
    update: ->
        @field.onUpdate()
