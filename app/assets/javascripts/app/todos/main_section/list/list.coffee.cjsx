@List = React.createClass

  render: ->
    <ul id="todo-list">
      { <Item item={item} /> for item in @props.todos }
    </ul>
