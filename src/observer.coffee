class Publisher
  constructor: ->
    @subscribers = { any:[] }

  subscribe: (fn, type) ->
    type = type or 'any'
    @subscribers[type] = [] unless @subscribers[type]?
    @subscribers[type].push(fn)

  unsubscribe: (fn, type) -> @visitSubscriers('unsubscribe', fn, type)

  publish: (publication, type, cb ) -> @visitSubscriers('publish', publication, type, cb )

  visitSubscriers: (action, arg, type, cb) ->
    pubtype = type or 'any'
    subscribers = @subscribers[pubtype]
    for subscribe,i in @subscribers[pubtype]
      switch action
        when 'publish' then subscribe(arg)
        else
            @subscribers[pubtype].splice(i,1) if subscribe is arg
    cb() if ( cb )
