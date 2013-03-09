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
    contains: ( position )->
        isInsideX = @isInsideX( position )
        isInsideY = @isInsideY( position )
        return ( isInsideX && isInsideY )
    isInsideX: ( position )->
        return ( ( @position.getX() <= position.getX() ) && ( position.getX() < ( @position.getX() + @getWidth()  ) ) )
    isInsideY: ( position )->
        return ( ( @position.getY() <= position.getY() ) && ( position.getY() < ( @position.getY() + @getHeight() ) ) )
    isUpper: ( position )->
        isInsideX = @isInsideX( position )
        if ( !isInsideX )
             return
        # 自分よりも上にあるかどうか。
        return ( @position.getY() > position.getY() ) && isInsideX
