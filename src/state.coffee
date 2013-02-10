class StateManager
    constructor: ( rootState )->
        @stack = []
        @pushState = rootState
    pushState: ( state )->
        state?.setup()
        @stack.push state
    popState: ->
        state = @stack.pop()
        state.teardown()
        return state
    replaceState: ( state )->
        @popState()
        @pushState state
    currentState : () ->
        return @stack.last()

class State
    constructor : ()->
        ""
    setup: ->
        @
    teardown: ->
        @
    update: ->
        true

class ReadyState extends State
