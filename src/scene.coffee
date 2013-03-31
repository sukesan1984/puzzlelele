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
        position     = new Position( 0, 100 )
        #staticState = new StaticState( position )
        moveState   = new MoveState( new Vector( 40, -40 ), new Vector( 0, 9.8 ), position )

        panel        = new Panel( sprite, position, moveState )
        #panel        = new Panel( sprite, position, staticState )
        panel.appendToParent( @ )
        @.addEventListener('enterframe', panel.onUpdate )
    update: ->
        @field.onUpdate()
    onTouchStart: ( e )->
        @field.onTouchStart( e )
