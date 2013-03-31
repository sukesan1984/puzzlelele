class Position
    constructor: ( x, y )->
        @_x = x
        @_y = y
    getX: ->
        return @_x
    setX: ( x )->
        @_x = x
        return @_x
    getY: ->
        return @_y
    setY: ( y )->
        @_y = y
        return @_y
exports.Position = Position

