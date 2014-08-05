@Item = React.createClass

  render: ->
    <li className="completed">
      <div className="view">
        <input className="toggle" type="checkbox" checked />
        <label>Create a TodoMVC template</label>
        <button className="destroy"></button>
      </div>
      <input className="edit" value="Create a TodoMVC template" />
    </li>
