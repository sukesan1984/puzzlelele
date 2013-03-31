expect    = require 'expect.js'
MoveState = require('../../src/state/move_state').MoveState
Position  = require('../../src/position').Position
Vector    = require('../../src/vector').Vector
describe 'MoveState', ->
    vector    = new Vector( 1, 3 )
    position  = new Position( 4, 5 )
    moveState = new MoveState( vector, position )

    it 'new', ->
        expect( moveState ).to.be.a( MoveState )

    it 'onUpdate', ->
        # 初期値
        expect( moveState.getPosition().getX() ).to.eql( 4 )
        expect( position.getY() ).to.eql( 5 )
        # 一回目
        moveState.onUpdate()
        expect( moveState.position.getX() ).to.eql( 5 )
        expect( moveState.position.getY() ).to.eql( 8 )
        # 二回目
        moveState.onUpdate()
        expect( moveState.position.getX() ).to.eql( 6 )
        expect( moveState.position.getY() ).to.eql( 11 )
