class Field
    constructor: ->
        @WIDTH  = 8
        @HEIGHT = 8
        @removeObserver    = new Array
        @updateObserver = new Array
        @touchObserver = new Array
    onEnter: ->
        #for i in [1..@WIDTH]
            #for j in [1..@HEIGHT]
                #panelNum = parseInt( Math.random() * 5 )
                #panel    = new Panel( panelNum, {x: 32 * i, y:32 * j} )
                #@addRemoveObserver( panel.onRemovePanel.bind( panel ) )
                #@addTouchObserver( panel.onTouchField.bind( panel ) )
                #@addUpdateObserver( panel.onUpdate.bind( panel ) )
                #Puzzlelele.game.rootScene.addChild(panel)
                #panel.addRemoveObserver( @onRemovePanel.bind( @ ) )
        #@panel    = new Panel( 0, {x: 32 * 0, y:32 * 0} )


    onUpdate: ->
        #func() for func in @updateObserver
        #@panel.moveTo( parseInt( Math.random() * 50 ), parseInt( Math.random() * 50 ) )
    addRemoveObserver: ( func )->
        @removeObserver.push func
    addUpdateObserver: ( func )->
        @updateObserver.push func
    addTouchObserver: ( func )->
        @touchObserver.push func
    onRemovePanel: ( x, y )->
        func( x, y ) for func in @removeObserver
    onTouchStart: ( e )->
        func( e.localX, e.localY ) for func in @touchObserver
