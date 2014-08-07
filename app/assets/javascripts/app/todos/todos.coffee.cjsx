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
    @setState
      todos: @state.todos.concat
        note: note
        complete: false

  _completeNumber: ->
    @__completeNumber ||=
      _.filter(@state.todos, (t) -> t.complete).length
