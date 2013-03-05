class Field
    constructor: ->
        @WIDTH  = 8
        @HEIGHT = 8
        @fieldObserver    = new Array
        @updateObserver = new Array
    onEnter: ->
        for i in [1..@WIDTH]
            for j in [1..@HEIGHT]
                panelNum = parseInt( Math.random() * 5 )
                panel    = new Panel( panelNum, {x: 32 * i, y:32 * j} )
                @addFieldObserver( panel.onChangeField.bind( panel ) )
                @addUpdateObserver( panel.onUpdate.bind( panel ) )
                Puzzlelele.game.rootScene.addChild(panel)
                panel.addRemoveObserver( @onRemovePanel.bind( @ ) )
    onUpdate: ->
        func() for func in @updateObserver
    addFieldObserver: ( func )->
        @fieldObserver.push func
    addUpdateObserver: ( func )->
        @updateObserver.push func
    onRemovePanel: ( x, y )->
        func( x, y ) for func in @fieldObserver
