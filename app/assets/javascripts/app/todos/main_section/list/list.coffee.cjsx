@List = React.createClass

  mixins: [ActionsHandler]

  localActions:
    unfilter_tasks: ->
      @setState filter: undefined

    filter_active_tasks: ->
      @setState filter: false

    filter_completed_tasks: ->
      @setState filter: true

  getInitialState: ->
    filter: undefined

  componentDidMount: ->
    @listenForEvents()

  render: ->
    <ul id="todo-list">
      { <Item item={item} /> for item in @_filtered(@props.todos) }
    </ul>

  _filtered: (todos) ->
    unless @state.filter?
      return todos
    _.filter todos, complete: @state.filter
