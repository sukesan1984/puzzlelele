if require?
    State = require('../state').State

class MoveState extends State

if module?.exports
    module.exports.MoveState = MoveState
else
    @MoveState = MoveState
