if require?
    State = require('../state').State

class MoveState extends State
    constructor: ( vector, position )->
        @vector      = vector     # 速度ベクトル
        @position    = position   # 現在地

    onUpdate: ()->
        @position.setX( @position.getX() + @vector.getX() )
        @position.setY( @position.getY() + @vector.getY() )

    getPosition: ()->
        return @position

if module?.exports
    module.exports.MoveState = MoveState
else
    @MoveState = MoveState
