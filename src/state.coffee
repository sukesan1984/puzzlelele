class State
    constructor: ()->
    onUpdate: ()->
if module?.exports
    module.exports.State = State
else
    @State = State
