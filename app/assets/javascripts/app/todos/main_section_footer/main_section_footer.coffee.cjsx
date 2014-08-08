@MainSectionFooter = React.createClass

  render: ->
    <footer id="footer">
      <span id="todo-count"><strong>{@props.left}</strong> item left</span>
      <ul id="filters">
        <li>
          <a onClick={@_all} href="#/">All</a>
        </li>
        <li>
          <a onClick={@_active} href="#/active">Active</a>
        </li>
        <li>
          <a onClick={@_completed} href="#/completed">Completed</a>
        </li>
      </ul>
    </footer>

  _all: ->
    Dispatcher.trigger 'unfilter_tasks'

  _active: ->
    Dispatcher.trigger 'filter_active_tasks'

  _completed: ->
    Dispatcher.trigger 'filter_completed_tasks'
