#= require node_dependencies
#= require jquery
#= require jquery_ujs
#= require backbone.events
#= require_tree ./mixins
#= require_tree ./app

@Dispatcher = _.extend {}, Events
React.renderComponent App(null), document.body
