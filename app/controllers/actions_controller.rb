class ActionsController < SerializationsController

  def router
    perform_action
    path = params[:url].gsub(/^api\//, '')
    split_path(path)
    super
  end

  private

  def action
    get_class @path, 'action'
  end

  def perform_action
    check_is_action_allowed!
    action.new(params, session).send @method
  end

  def check_is_action_allowed!
    if action.instance_methods(false).exclude? @method.to_sym
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
