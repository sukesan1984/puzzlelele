if require?
    State = require('../state').State

class MoveState extends State
    constructor: ( vector, position )->
        @vector   = vector
        @position = position

    onUpdate: ()->
        @position.setX( @position.getX() + @vector.getX() )
        @position.setY( @position.getY() + @vector.getY() )

    getPosition: ()->
        return @position

if module?.exports
    module.exports.MoveState = MoveState
else
    @MoveState = MoveState
