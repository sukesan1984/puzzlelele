class Field
    constructor: ( parentScene )->
        @.parentScene = parentScene
        @WIDTH  = 8
        @HEIGHT = 8
        @removeObserver = new Publisher()
        @updateObserver = new Publisher()
        @touchObserver  = new Publisher()
    onEnter: ->
        for i in [1..@WIDTH]
            for j in [1..@HEIGHT]
                panelNum = parseInt( Math.random() * 5 )
                panel    = new Panel( panelNum, new Position( 32 * i, 32 * j ) , @ )
                @removeObserver.subscribe( panel.onRemovePanel.bind( panel ) )
                @touchObserver.subscribe( panel.onTouchField.bind( panel ) )
                @updateObserver.subscribe( panel.onUpdate.bind( panel ) )
                @.parentScene.addChild(panel)
                panel.addRemoveObserver( @onRemovePanel.bind( @ ) )

    onUpdate: ->
    onRemovePanel: ( pos )->
        @removeObserver.publish( pos )
    onTouchStart: ( e )->
        pos = new Position( e.localX, e.localY )
        @touchObserver.publish( pos )
    remove: ( panel )->
        @touchObserver.unsubscribe( panel.onTouchField.bind( panel ) )
        @removeObserver.unsubscribe( panel.onRemovePanel.bind( panel ) )
        @updateObserver.unsubscribe( panel.onUpdate.bind( panel ) )

        @.parentScene.removeChild( panel )
