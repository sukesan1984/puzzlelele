class Model
    constructor: ()->

class Panel extends Model
    constructor: ( width, height )->
        for i in [0..width]
            @[i] = []
            for j in [0..height]
                @[i][j] = 0
