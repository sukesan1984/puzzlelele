class Field
    constructor: ( parentScene )->
        @.parentScene = parentScene
        @WIDTH  = 8
        @HEIGHT = 8
        @removeObserver = new Publisher()
        @updateObserver = new Publisher()
        @touchObserver  = new Publisher()
        @panelManager  = new PanelManager()
        @numMovingPanel = 0
        @removed        = false
    setRemoved: ( removed )->
        @removed = removed
    onEnter: ->
        for i in [0..@WIDTH]
            for j in [0..@HEIGHT]
                panel = @createPanel( 32 * i, 32 * j )
    countUpNumMovingPanel: ->
        @numMovingPanel++
    countDownNumMovingPanel: ->
        @numMovingPanel--

    onUpdate: ->
        @updateObserver.publish()
        return if ( @removed )
        @removePanels()
        console.log( @numMovingPanel )
        return if ( @numMovingPanel ) #動いているときは何もしない。
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
        # 最初につながりをリセットする。
        @panelManager.resetConnect()
        @panelManager.markConnect()

        # 3マッチしたパネルが一つもなければ、
        @removed = @panelManager.isRemovedAll()

    onRemovePanel: ( rectangle )=>
        #@createPanel( rectangle.getPosition().getX(), -32 )
        @removeObserver.publish( rectangle )
        @panelManager.fixMoveDistance()

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
        #@panelManager.unregister( panel )
