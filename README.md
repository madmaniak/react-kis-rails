# Keep it simple

## Quick start

```
git clone git@github.com:madmaniak/react-kis-rails.git
cd react-kis-rails
bundle
rails s
```

Checkout [localhost:3000](http://localhost:3000). Read commits.

## Assumptions

### Frontend

- Everything (except Backbone.Events) is a component even Router.

- There is only one state of particular data. Therefore there is no need to synchronize data over the application. You can find component proper for state by [LCE](http://en.wikipedia.org/wiki/Lowest_common_ancestor).

- There is no models or collections but pure data in <code>state</code>.

- Directories tree reflects virtual DOM structure of the app. Keep reusable components (e.g. UI components) outside this tree in <code>components</code> directory.

- Always emit event when action occurs and let it be handled by state component. Distinguish action handlers for local ones and ones talking with API.
 
### Frontend / Backend communication

- Each state component talking with API has it's own API endpoints. Lets call such component an __ASC__ - _Api State Component_.

- Don't do REST. We don't have models and collections. Distinguish reading from writing actions and keep it in sepparate flows.

Life cycle of __ASC__:
- after mounting component get state from API
- if action occurs
 - remember old state
 - set expected result to state basing on passed params
 - post action with params and callback state url to the API
 - [API] set new state basing on action and params
 - [API] redirect to callback state url and return current state of __ASC__
- if action fails
 - bring back old state

### Backend

- Don't map routings manually. Ask proper serializers or actions basing on get/post and url.
- Each __ASC__ has it's own Serializer and Actions class.

## Demo

Item triggers __delete_task__ on button click.

```coffeescript
@Item = React.createClass

  render: ->
    <label>{@props.item.note}</label>
     <button
       className="destroy"
       onClick={@_onClick}
     ></button>

  _onClick: (e) ->
    Dispatcher.trigger 'delete_task', id: @props.item.id
```

Essential part of __ASC__:

```coffeescript
@Todos = React.createClass

  mixins: [ActionsHandler]

  url: 'api/todos'

  actions:
  
    # handle delete_task action here:
    delete_task: (params) ->
      @todos.splice _.findIndex(@todos, id: params.id), 1

  getInitialState: ->
    todos: []

  componentDidMount: ->
    @listenForEvents()
    $.get @url, (result) => @setState(result)

  render: ->
    <MainSection todos={@state.todos} /> # Item component is somewhere below MainSection 
```

Handle action on the backend:

```ruby
class TodosAction < ApplicationAction

  def delete_task
    Task.find_by(id: params[:id]).delete
  end

end
```
