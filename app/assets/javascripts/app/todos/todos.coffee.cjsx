@Todos = React.createClass

  getInitialState: ->
    todos: []

  componentDidMount: ->
    $.get 'api/todos', (result) => @setState(result)

  render: ->
    <section id="todoapp">
      <Header />
      <MainSection todos={@state.todos} />
      <MainSectionFooter />
    </section>
