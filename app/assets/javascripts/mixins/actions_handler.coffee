@ActionsHandler =

  listenForEvents: ->
    _.extend(@, Events)
    for event, method of @actions
      @listenTo Dispatcher, event, @_perform(event)

    for event, method of @localActions
      @listenTo Dispatcher, event, method

  _perform: (event) ->
    (params) =>
      state = _.cloneDeep @state
      @actions[event].call state, params
      @_latencyCompenstation "#{@url}/#{event}", params, state

  _latencyCompenstation: (action, data = {}, newState) ->
    oldState = @state
    @setState newState

    $.post action, _.merge(data, url: @url), (response) =>
      @setState response
    .fail =>
      @replaceState oldState
