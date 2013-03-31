expect    = require 'expect.js'
MoveState = require('../../src/state/move_state').MoveState
Position  = require('../../src/position').Position
Vector    = require('../../src/vector').Vector

describe 'MoveState', ->
    vector       = new Vector( 1, 3 )
    acceleration = new Vector( 0, 9 )
    position     = new Position( 4, 5 )
    moveState    = new MoveState( vector, acceleration, position )


    it 'new', ->
        expect( moveState ).to.be.a( MoveState )
    
    it 'countUp', ->
        moveState.fps = 4
        expect( moveState.countUp() ).to.eql(0.25)
        expect( moveState.countUp() ).to.eql(0.50)
        expect( moveState.countUp() ).to.eql(0.75)
        expect( moveState.countUp() ).to.eql(1)
        expect( moveState.countUp() ).to.eql(1.25)

    it 'onUpdate 0', ->
        # 初期値
        console.log('initial')
        moveState.time = 0
        expect( moveState.position.getX() ).to.eql( 4 )
        expect( moveState.position.getY() ).to.eql( 5 )
    it 'onUpdate 1', ->
        # 一回目
        console.log('first')
        moveState.time = 1
        moveState.onUpdate()
        expect( moveState.position.getX() ).to.eql( 5 )
        expect( moveState.position.getY() ).to.eql( 12 )
    it 'onUpdate 2', ->
        # 二回目
        console.log('second')
        moveState.time = 2
        moveState.onUpdate()
        expect( moveState.position.getX() ).to.eql( 6 )
        expect( moveState.position.getY() ).to.eql( 29 )
