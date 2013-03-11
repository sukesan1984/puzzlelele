class Field
    constructor: ( parentScene )->
        @.parentScene = parentScene
        @WIDTH  = 8
        @HEIGHT = 8
        @removeObserver = new Publisher()
        @updateObserver = new Publisher()
        @touchObserver  = new Publisher()
        @panelManager  = new PanelManager()
        @moved          = false
        @removed        = true
    setMoved: ( moved )->
        @moved = moved
    setRemoved: ( removed )->
        @removed = removed
    onEnter: ->
        for i in [0..@WIDTH]
            for j in [0..@HEIGHT]
                panel = @createPanel( 32 * i, 32 * j )

    onUpdate: ->
        @updateObserver.publish()
        return if ( @removed )
        @removePanels()
        return if ( @moved )
        @markConnectedPanels()

    createPanel: ( x, y )->
        panelNum = parseInt( Math.random() * 5 )
        panel    = new Panel( panelNum, new Position( x, y ) , @ )
        @removeObserver.subscribe( panel.onRemovePanel )
        @touchObserver.subscribe( panel.onTouchField )
        @updateObserver.subscribe( panel.onUpdate )
        @.parentScene.addChild(panel)
        @panelManager.register( panel )
        panel.addRemoveObserver( @onRemovePanel )
        return panel
    removePanels: ()->
        # markされたパネルを削除する。
        @panelManager.remove()
    markConnectedPanels: ()->
        # 3マッチしたパネルをマークしていく。
        # 3マッチしたパネルが一つもなければ、
        @removed = true

    onRemovePanel: ( rectangle )=>
        #@createPanel( rectangle.getPosition().getX(), -32 )
        @removeObserver.publish( rectangle )

    onTouchStart: ( e )->
        if ( !@removed )
            # すべての移動が終了するまでは何も出来ない。
            return
        x = e.localX
        y = e.localY
        touchPosition = new Position(  x - 16 , y - 16 )
        @touchObserver.publish( touchPosition )
    remove: ( panel )->
        @updateObserver.unsubscribe( panel.onUpdate )
        @touchObserver.unsubscribe ( panel.onTouchField )
        @removeObserver.unsubscribe( panel.onRemovePanel )
        panel.deleteRemoveObserver( @onRemovePanel )

        @.parentScene.removeChild( panel )
