expect = require 'expect.js'
Vector = require('../src/vector').Vector

describe 'Vector set', ->
    vector = new Vector( 1, 3 )

    it 'new', ->
        expect( vector ).to.be.a(Vector)

    it 'getX', ->
        expect( vector.getX() ).to.eql( 1 )

    it 'getY', ->
        expect( vector.getY() ).to.eql( 3 )

describe 'Vector no set', ->
    vector = new Vector()

    it 'new', ->
        expect( vector ).to.be.a(Vector)

    it 'getX', ->
        expect( vector.getX() ).to.eql( 0 )

    it 'getY', ->
        expect( vector.getY() ).to.eql( 0 )

