class PanelManager extends Array
    constructor: ->
    register: ( panel )->
        @.push panel
    unregister: ( panel )->
        i = @.indexOf( panel )
        @.splice( i, 1 ) if ( i != -1 )
    remove: ()->
        panel.remove() for panel in @
