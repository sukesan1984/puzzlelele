class State
    constructor: ( position )->
        @position = position
    onUpdate: ()->
    getPosition: ()->
        return @position
if module?.exports
    module.exports.State = State
else
    @State = State
