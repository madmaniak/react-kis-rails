@ActionsHandler =

  listenForEvents: ->
    _.extend(@, Events)
    for event, method of @actions
      @listenTo Dispatcher, event, @_perform(event)

  _perform: (event) ->
    (params) =>
      @_latencyCompenstation "#{@url}/#{event}", params, @actions[event].call(@, params)

  _latencyCompenstation: (action, data, newState) ->
    oldState = @state
    @setState newState

    $.post action, data, (response) =>
      @setState response
    .fail =>
      @replaceState oldState
