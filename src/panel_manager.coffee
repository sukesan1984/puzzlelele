class PanelManager extends Array
    constructor: ->
    register: ( panel )->
        @.push panel
    unregister: ( panel )->
        i = @.indexOf( panel )
        @.splice( i, 1 ) if ( i != -1 )
    remove: ()->
        panel?.remove() for panel in @
    resetConnect: ()->
        panel.resetConnect() for panel in @
    markConnect: ()->
        temp = {}
        willRemoved = false

        for panel in @
            checkTemp = {}
            index = panel.getIndex()
            x = index.x
            y = index.y
            temp[x] = {} if ( !temp[x] )
            temp[x][y] = panel # 格納
            @addConnect( panel.getType(), temp, x, y, checkTemp )

    addConnect: ( type, temp, x, y, checkTemp )->
        checkTemp[x] = {} if ( !checkTemp[x] )
        return if ( checkTemp[x][y] ) #チェック済みなら何もしない。
        checkTemp[x][y] = true

        # 左
        if ( ( x - 1 ) >= 0 )
            connected = temp[x-1][y].setConnect( type, 'x' ) if ( temp[x-1] && temp[x-1][y] )
            @addConnect( type, temp, x - 1, y, checkTemp ) if ( connected )
        # 右
        if ( ( x + 1 ) <= 8 )
            connected = temp[x+1][y].setConnect( type, 'x' ) if ( temp[x+1] && temp[x+1][y] )
            @addConnect( type, temp, x + 1, y, checkTemp ) if ( connected )
        # 上
        if ( ( y - 1 ) >= 0 )
            connected = temp[x][y-1].setConnect( type, 'y' ) if ( temp[x] && temp[x][y-1] )
            @addConnect( type, temp, x, y - 1, checkTemp ) if ( connected )
        # 下
        if ( ( y + 1 ) <= 8 )
            connected = temp[x][y+1].setConnect( type, 'y' ) if ( temp[x] && temp[x][y+1] )
            @addConnect( type, temp, x, y + 1, checkTemp ) if ( connected )

    isRemovedAll: ->
        for panel in @
            return false if ( panel.getWillRemoved() ) #一つでも消えるものがあれば、false
        return true
    fixMoveDistance: ->
        for panel in @
            panel.fixedMoveDistance = true
