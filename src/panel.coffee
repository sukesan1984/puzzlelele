class Panel extends Sprite
    constructor: ( panelType, position, field )->
        super 64, 64
        @WIDTH = 32
        @HEIGHT = 32
        @type      = panelType
        @rectangle = new Rectangle( position, @WIDTH, @HEIGHT )
        @position  = position
        @updatePosition()
        @field    = field
        @vy       = 0
        @aimY     = @position.getY()
        @move     = 0
        @passedTime = 0
        @fixedMoveDistance = false
        @.image   = Puzzlelele.game.assets[ @getImage( @type ) ]
        @.scale( 0.5, 0.5 )
        @removeObserver = new Publisher()
        @willRemoved = 0
        @connect  = new Connect()
    updatePosition: ()->
        @.moveTo( @position.getX(), @position.getY() )
        @rectangle.setPosition( @position )
    getType: ->
        return @type

    getIndex: ->
        x = parseInt( @position.getX() / @WIDTH )
        y = parseInt( @position.getY() / @HEIGHT )
        return { x: x, y: y }
    resetConnect: ->
        @connect.reset()
    getWillRemoved: ->
        return @willRemoved

    setConnect: ( type, direction )->
        return false if type isnt @type
        switch direction
            when 'x'
                x = @connect.addX()
                @willRemoved = true if ( x >= 3)
            when 'y'
                y = @connect.addY()
                @willRemoved = true if ( y >= 3)
        return true
    getImage: ( panelType )->
        @PANEL_IMAGE = {
            0: 'resources/images/nebukuro.png'
            , 1: 'resources/images/yuka.png'
            , 2: 'resources/images/tate.png'
            , 3: 'resources/images/ken.png'
            , 4: 'resources/images/slime.png'
        }
        return @PANEL_IMAGE[ panelType ]
    onUpdate: =>
        if ( !@move )
            return
        if ( !@fixedMoveDistance ) #移動距離が確定するまで何もしない
            return
        gravity = 0.98
        @vy   = gravity * @.passedTime
        @position.setY( @position.getY() + @vy )
        @passedTime += 1
        if ( @aimY < @position.getY() )
            #目的の位置よりも移動しすぎた時に微調整。
            @field.countDownNumMovingPanel()
            @position.setY( @aimY )
            @fixedMoveDistance = false #移動終了
            @aimY = @position.getY()
            @dY = 0
            @passedTime = 0
            @move       = false

        @updatePosition( @position )

    setAim: ( dy )->
        @move = 1
        @aimY += dy

    addRemoveObserver: ( func )=>
        @removeObserver.subscribe( func )
    deleteRemoveObserver: ( func )=>
        @removeObserver.unsubscribe( func )
    onRemovePanel: ( rectangle )=>
        if ( rectangle.isUpper( @position ) )
            @field.countUpNumMovingPanel() if( !@move ) # 最初の一回だけカウントアップ
            @setAim( @HEIGHT )
    onTouchField: ( touchPosition )=>
        if ( @rectangle.contains( touchPosition ) )
            ## このパネルがタッチされた。
            @willRemoved = true
            @field.setRemoved( false )
    remove: =>
        return if ( !@willRemoved ) #削除候補でなければ、何もしない。
        return if ( @field.getNumMovingPanel() ) # 動いてるなら消えないよね。
        @removeObserver.publish( @rectangle )
        @field.remove( @ ) #最後に消す。
