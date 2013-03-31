expect = require 'expect.js'
StaticState = require('../../src/state/static_state').StaticState
describe 'StaticState', ->
    staticState = new StaticState
    
    it 'new', ->
        expect( staticState ).to.be.a(StaticState)
