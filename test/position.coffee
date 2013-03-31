expect = require 'expect.js'
Position = require('../src/position').Position
describe 'Position', ->
    position = new Position( 15, 20 )

    it 'new', ->
        expect( position ).to.be.a( Position )
    
    it 'getX', ->
        expect( position.getX() ).to.eql( 15 )

    it 'getY', ->
        expect( position.getY() ).to.eql( 20 )

    it 'setX', ->
        expect( position.setX( 30 ) ).to.eql( 30 )
        expect( position.getX() ).to.eql( 30 )

    it 'setY', ->
        expect( position.setY( 10 ) ).to.eql( 10 )
        expect( position.getY() ).to.eql( 10 )
