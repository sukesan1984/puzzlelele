expect = require 'expect.js'
Panel = require('../src/panel').Panel
Position = require('../src/position').Position

describe 'Panel', ->
    position = new Position( 15, 20 )
    sprite = {x:0, y:0} # 仮にspriteは座標だけ持つものとして定義しとく。
    panel    = new Panel( sprite, position )

    it 'new', ->
        console.log('new')
        expect( panel ).to.be.a(Panel)
        expect( panel.sprite.x ).to.eql(15)
        expect( panel.sprite.y ).to.eql(20)
