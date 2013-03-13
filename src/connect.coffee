class Connect
    constructor: ->
        @_x = 1 # X軸方向につながっている数
        @_y = 1 # Y軸方向につながっている数
    reset: ->
        @_x = 1
        @_y = 1
    addX: ->
        @_x++
        return @_x
    addY: ->
        @_y++
        return @_y
    getX: ->
        return @_x
    getY: ->
        return @_y
