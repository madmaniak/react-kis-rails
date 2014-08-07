@Todos = React.createClass

  mixins: [ActionsHandler]

  url: 'api/todos'

  actions:
    new_task: (params) ->
      todos: @state.todos.concat
        note: params.note
        complete: false

  getInitialState: ->
    todos: []

  componentDidMount: ->
    @listenForEvents()
    $.get @url, (result) => @setState(result)

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
