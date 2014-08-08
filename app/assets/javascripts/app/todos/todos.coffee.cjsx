@Todos = React.createClass

  mixins: [ActionsHandler]

  url: 'api/todos'

  actions:
    new_task: (params) ->
      @todos.push
        note: params.note
        complete: false

    task_toggle: (params) ->
      task = _.find(@todos, id: params.id)
      task.complete = params.complete

    complete_all_tasks: ->
      _.each @todos, (task) -> task.complete = true

    restart_all_tasks: ->
      _.each @todos, (task) -> task.complete = false; true

    delete_task: (params) ->
      @todos.splice _.findIndex(@todos, id: params.id), 1


  getInitialState: ->
    todos: []

  componentDidMount: ->
    @listenForEvents()
    $.get @url, (result) => @setState(result)

  render: ->
    __completeNumber = @_completeNumber()

    <section id="todoapp">
      <Header />
      <MainSection todos={@state.todos} />
      <MainSectionFooter
        complete={__completeNumber}
        left={@state.todos.length - __completeNumber}
      />
    </section>

  _completeNumber: ->
    _.filter(@state.todos, 'complete').length
