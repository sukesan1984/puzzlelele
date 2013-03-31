if require?
    Position    = require('../src/position').Position
    StaticState = require('../src/static_state').StaticState
    Panel       = require('../src/panel').Panel

class MainScene extends Scene
    constructor: ->
        super
    setup: ->
        sprite       = new Sprite( 64, 64 )
        sprite.image = Puzzlelele.game.assets[ 'resources/images/nebukuro.png' ]
        position     = new Position( 10, 10 )
        static_state = new StaticState()

        panel        = new Panel( sprite, position, static_state )
        panel.appendToParent( @ )
    update: ->
        @field.onUpdate()
    onTouchStart: ( e )->
        @field.onTouchStart( e )
