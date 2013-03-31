State = require('./state').State

class StaticState extends State
    onUpdate: ()->
        console.log("何もしない。")

exports.StaticState = StaticState
