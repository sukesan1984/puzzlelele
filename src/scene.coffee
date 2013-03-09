class MainScene extends Scene
    constructor: ->
        super
        @stateManager = new StateManager( new ReadyState() )

    setup: ->
        @field = new Field()
        @field.onEnter()
        @.addEventListener 'touchstart', @onTouchStart.bind( @ )
    update: ->
        @field.onUpdate()
    onTouchStart: ( e )->
        @field.onTouchStart( e )
