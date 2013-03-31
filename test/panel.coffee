expect = require 'expect.js'
Panel = require('../src/panel').Panel

describe 'Panel', ->
    panel = new Panel

    it 'new', ->
        expect( panel ).to.be.a(Panel)
