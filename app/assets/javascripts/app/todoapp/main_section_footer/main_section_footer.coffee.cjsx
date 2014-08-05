@MainSectionFooter = React.createClass

  render: ->
    <footer id="footer">
      <span id="todo-count"><strong>0</strong> item left</span>
      <ul id="filters">
        <li>
          <a className="selected" href="#/">All</a>
        </li>
        <li>
          <a href="#/active">Active</a>
        </li>
        <li>
          <a href="#/completed">Completed</a>
        </li>
      </ul>
      <button id="clear-completed">Clear completed (0)</button>
    </footer>
