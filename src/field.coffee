class Field
    constructor: ( parentScene )->
        @.parentScene = parentScene
        @WIDTH  = 8
        @HEIGHT = 8
        @removeObserver = new Publisher()
        @updateObserver = new Publisher()
        @touchObserver  = new Publisher()
        @moving         = 0
        @checked        = 0
        @panels         = new Array()
    setMoving: ( moving )->
        @moving = moving
    onEnter: ->
        for i in [0..@WIDTH]
            for j in [0..@HEIGHT]
                panel = @createPanel( 32 * i, 32 * j )

    onUpdate: ->
        @updateObserver.publish()
        #if ( !@moving )
            # 動いてないときにつながりをチェックする
            #console.log(@getPanelMap())
    createPanel: ( x, y )->
        panelNum = parseInt( Math.random() * 5 )
        panel    = new Panel( panelNum, new Position( x, y ) , @ )
        @removeObserver.subscribe( panel.onRemovePanel.bind( panel ) )
        @touchObserver.subscribe( panel.onTouchField.bind( panel ) )
        @updateObserver.subscribe( panel.onUpdate.bind( panel ) )
        @.parentScene.addChild(panel)
        panel.addRemoveObserver( @onRemovePanel.bind( @ ) )
        this.panels.push panel
        return panel

    onRemovePanel: ( rectangle )->
        @createPanel( rectangle.getPosition().getX(), -32 )
        @removeObserver.publish( rectangle )

    onTouchStart: ( e )->
        if ( @moving )
            return
        pos = new Position( e.localX, e.localY )
        @touchObserver.publish( pos )
    remove: ( panel )->
        @touchObserver.unsubscribe( panel.onTouchField.bind( panel ) )
        @removeObserver.unsubscribe( panel.onRemovePanel.bind( panel ) )
        @updateObserver.unsubscribe( panel.onUpdate.bind( panel ) )

        @.parentScene.removeChild( panel )
