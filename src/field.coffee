class Field
    constructor: ( parentScene )->
        @.parentScene = parentScene
        @WIDTH  = 8
        @HEIGHT = 8
        @removeObserver = new Array
        @updateObserver = new Array
        @touchObserver  = new Publisher()
    onEnter: ->
        for i in [1..@WIDTH]
            for j in [1..@HEIGHT]
                panelNum = parseInt( Math.random() * 5 )
                panel    = new Panel( panelNum, new Position( 32 * i, 32 * j ) , @ )
                @addRemoveObserver( panel.onRemovePanel.bind( panel ) )
                @touchObserver.subscribe( panel.onTouchField.bind( panel ) )
                @addUpdateObserver( panel.onUpdate.bind( panel ) )
                @.parentScene.addChild(panel)
                panel.addRemoveObserver( @onRemovePanel.bind( @ ) )

    onUpdate: ->
        #func() for func in @updateObserver
        #@panel.moveTo( parseInt( Math.random() * 50 ), parseInt( Math.random() * 50 ) )
    addRemoveObserver: ( func )->
        @removeObserver.push func
    addUpdateObserver: ( func )->
        @updateObserver.push func
    #addTouchObserver: ( func )->
        #@touchObserver.push func
    onRemovePanel: ( x, y )->
        func( x, y ) for func in @removeObserver
    onTouchStart: ( e )->
        pos = new Position( e.localX, e.localY )
        #func( pos ) for func in @touchObserver
        @touchObserver.publish( pos )
    remove: ( panel )->
        @touchObserver.unsubscribe( panel.onTouchField.bind( panel ) )
        @.parentScene.removeChild( panel )
