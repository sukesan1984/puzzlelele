# ブラウザ対応で、requireが使えれば、使うというようにしておく。
if require?
    State = require('../state').State

class StaticState extends State
    onUpdate: ()->

# ブラウザ対応で、module.exportsがあれば、それにexportsするようにする。
if module?.exports
    module.exports.StaticState = StaticState
else
    @StaticState = StaticState
