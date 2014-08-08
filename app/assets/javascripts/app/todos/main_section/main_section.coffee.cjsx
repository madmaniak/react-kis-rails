@MainSection = React.createClass

  render: ->
    <section id="main">
      <input
        id="toggle-all"
        type="checkbox"
        onChange={@_onChange}
        checked={@_checked()}
      />
      <label htmlFor="toggle-all">Mark all as complete</label>
      <List todos={@props.todos} />
    </section>

  _onChange: (e) ->
    action = if e.target.checked then 'complete_all_tasks' else 'restart_all_tasks'
    Dispatcher.trigger action

  _checked: ->
    _.every @props.todos, 'complete'
