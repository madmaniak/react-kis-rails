@Item = React.createClass

  render: ->
    <li className={ "completed" if @props.item.complete }>
      <div className="view">
        <input
          className="toggle"
          type="checkbox"
          checked={@props.item.complete}
          onChange={@_onChange}
        />
        <label>{@props.item.note}</label>
        <button className="destroy"></button>
      </div>
      <input className="edit" value={@props.item.note} />
    </li>

  _onChange: (e) ->
    item = @props.item
    Dispatcher.trigger 'task_toggle', id: item.id, complete: !item.complete
