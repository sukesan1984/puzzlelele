if require?
    Position    = require('../src/position').Position
    StaticState = require('../src/static_state').StaticState
    MoveState   = require('../src/move_state').MoveState
    Panel       = require('../src/panel').Panel
    Vector      = require('../src/vector').Vector

class MainScene extends Scene
    constructor: ->
        super
    setup: ->
        sprite       = new Sprite( 64, 64 )
        sprite.image = Puzzlelele.game.assets[ 'resources/images/nebukuro.png' ]
        position     = new Position( 0, 0 )
        moveState    = new MoveState( new Vector( 0, 0 ), new Vector( 0, 200 ), position )

        staticState  = new StaticState( position )
        panel        = new Panel( sprite, position, moveState )

        panel.appendToParent( @ )
        @.addEventListener( 'enterframe', panel.onUpdate )

        setTimeout =>
                panel.state = staticState
            , 1000

    update: ->
        @field.onUpdate()
    onTouchStart: ( e )->
        @field.onTouchStart( e )
