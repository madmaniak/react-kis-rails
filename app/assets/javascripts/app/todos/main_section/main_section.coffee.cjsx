@MainSection = React.createClass

  render: ->
    <section id="main">
      <input id="toggle-all" type="checkbox" />
      <label htmlFor="toggle-all">Mark all as complete</label>
      <List />
    </section>
