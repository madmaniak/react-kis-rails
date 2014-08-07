@Input = React.createClass

  getInitialState: ->
    value: ''

  render: ->
    <input
      id="new-todo"
      onChange={@_onChange}
      onKeyDown={@_onKeyDown}
      value={@state.value}
      placeholder="What needs to be done?"
      autofocus
    />

  _onChange: (e) ->
    @setState value: e.target.value

  _onKeyDown: (e) ->
    ENTER_KEY_CODE = 13
    if e.keyCode == ENTER_KEY_CODE
      @_save()

  _save: ->
    Dispatcher.trigger 'new-task', @state.value
    @setState value: ''
