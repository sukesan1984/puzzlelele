class Position
    constructor: ( x, y )->
        @_x = x
        @_y = y
    getX: ->
        return @_x
    setX: ( x )->
        @_x = x
        return @_x
    incrementX: ( x )->
        @_x += x
        return @_x
    incrementY: ( y )->
        @_y += y
        return @_y
    getY: ->
        return @_y
    setY: ( y )->
        @_y = y
        return @_y

if module?.exports
    module.exports.Position = Position
else
    @Position = Position

