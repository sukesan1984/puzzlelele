expect = require 'expect.js'
State = require('../src/state').State

describe 'State', ->
    state = new State

    it 'new', ->
        expect( state ).to.be.a(State)
