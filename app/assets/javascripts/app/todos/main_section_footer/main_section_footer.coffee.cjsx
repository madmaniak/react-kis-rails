@MainSectionFooter = React.createClass

  render: ->
    <footer id="footer">
      <span id="todo-count"><strong>{@props.left}</strong> item left</span>
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
      <button id="clear-completed">Clear completed ({@props.complete})</button>
    </footer>
