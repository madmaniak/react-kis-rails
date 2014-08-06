@Todos = React.createClass

  getInitialState: ->
    todos: []

  componentDidMount: ->
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

  _completeNumber: ->
    @__completeNumber ||=
      _.filter(@state.todos, (t) -> t.complete).length
