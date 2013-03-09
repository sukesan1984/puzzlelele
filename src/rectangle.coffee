class Rectangle
    constructor: ( position, width, height )->
        @position = position
        @_width   = width
        @_height  = height
    # Position Classのobjectを引数にとる
    getPosition: ->
        return @position
    getWidth: ->
        return @_width
    getHeight: ->
        return @_height
    isInside: ( position )->
        isInsideX = ( ( @position.getX() < position.getX() ) && ( position.getX() < ( @position.getX() + @getWidth()  ) ) )
        isInsideY = ( ( @position.getY() < position.getY() ) && ( position.getY() < ( @position.getY() + @getHeight() ) ) )
        return ( isInsideX && isInsideY )

