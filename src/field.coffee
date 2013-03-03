class Field
    constructor: ->
        @WIDTH  = 8
        @HEIGHT = 8
        @PANEL_IMAGE = {
            0: 'resources/images/nebukuro.png'
            , 1: 'resources/images/ruby.png'
            , 2: 'resources/images/topaz.png'
            , 3: 'resources/images/saphire.png'
            , 4: 'resources/images/emerald.png'
        }
    onEnter: ->
        for i in [1..@WIDTH]
            for j in [1..@HEIGHT]
                panel    = new Sprite( 64, 64 )
                panelNum = parseInt( Math.random() * 5 ) 
                panel.image = Puzzlelele.game.assets[@PANEL_IMAGE[panelNum]]
                panel.scale( 0.5, 0.5 )
                panel.moveTo( 32 * i, 32 * j )
                Puzzlelele.game.rootScene.addChild(panel)
