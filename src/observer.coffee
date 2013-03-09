class Publisher
  constructor: ->
    @subscribers = { any:[] }

  subscribe: (fn, type) ->
    type = type or 'any'
    @subscribers[type] = [] unless @subscribers[type]?
    @subscribers[type].push(fn)

  unsubscribe: (fn, type) -> @visitSubscriers('unsubscribe', fn, type)

  publish: (publication, type) -> @visitSubscriers('publish', publication, type)

  visitSubscriers: (action, arg, type) ->
    pubtype = type or 'any'
    subscribers = @subscribers[pubtype]
    for subscribe,i in @subscribers[pubtype]
      switch action
        when 'publish' then subscribe(arg)
        else
            console.log( 'unsubscribe' )
            @subscribers[pubtype].splice(i,1) if subscribe is arg
