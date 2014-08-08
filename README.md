# Keep it simple

## Quick start

```
git clone git@github.com:madmaniak/react-kis-rails.git
cd react-kis-rails
bundle
rails s
```

Read commits.

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
