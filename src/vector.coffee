class Vector
    constructor: ( dx, dy ) ->
        @_dx = dx || 0
        @_dy = dy || 0
    getX: ->
        return @_dx
    getY: ->
        return @_dy

if module?.exports
    module.exports.Vector = Vector
else
    @Vector = Vector
