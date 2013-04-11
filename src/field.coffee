if require?

class Field
    constructor: ()->
        panels = []
    addPanel: ( position, panel )->
        panels.push panel


if module?.exports
    module.exports.Field = Field
else
    @Field = Field
