@Todos = React.createClass

  getInitialState: ->
    todos: []

  componentDidMount: ->
    _.extend(@, Events)
    @listenTo Dispatcher, 'new-task', @_addNewTask
    $.get 'api/todos', (result) => @setState(result)

  render: ->
    <section id="todoapp">
      <Header />
      <MainSection todos={@state.todos} />
      <MainSectionFooter
        complete={@_completeNumber()}
        left={@state.todos.length - @_completeNumber()}
      />
    </section>

  _addNewTask: (note) ->
    @_latencyCompenstation 'api/todos/add_new_task', note,
      todos: @state.todos.concat
        note: note
        complete: false

  _completeNumber: ->
    @__completeNumber ||=
      _.filter(@state.todos, (t) -> t.complete).length

  _latencyCompenstation: (action, data, newState) ->
    oldState = @state
    @setState newState

    $.post action, data, (response) =>
      @setState response
    .fail =>
      @replaceState oldState
