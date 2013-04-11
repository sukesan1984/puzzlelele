if require?
    State  = require('../state').State
    Vector = require('../vector').Vector

class MoveState extends State
    constructor: ( vector, acceleration, position )->
        @vector        = vector     # 初速度ベクトル
        @acceleration  = acceleration
        @position      = position   # 現在地
        @initialX      = position.getX()
        @initialY      = position.getY()
        @time          = 0          # 経過時間
        @fps           = 20

    # fpsの状態に合わせて、時間を進める。
    countUp: ()->
        @time += 1 / @fps
        return @time

    onUpdate: ()->
        @position.setX( parseInt( @initialX + @vector.getX() * @time + 1 / 2 * @acceleration.getX() * Math.pow(@time, 2) ) )
        @position.setY( parseInt( @initialY + @vector.getY() * @time + 1 / 2 * @acceleration.getY() * Math.pow(@time, 2) ) )
        @countUp()

if module?.exports
    module.exports.MoveState = MoveState
else
    @MoveState = MoveState
