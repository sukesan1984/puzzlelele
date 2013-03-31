class Panel
    constructor: ( sprite, position, state )->
        @sprite   = sprite
        @position = position
        @state    = state

        @updatePosition()
    updatePosition: ()->
        @sprite.x = @position.getX()
        @sprite.y = @position.getY()
        return @sprite

    appendToParent: ( parent )->
        parent.addChild( @sprite )
        return parent

if module?.exports
    module.exports.Panel = Panel
else
    @Panel = Panel
