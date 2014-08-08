class ActionsController < SerializationsController

  def router
    perform_action
    path = params[:url].gsub(/^api\//, '')
    split_path(path)
    super
  end

  private

  def perform_action
    action.new(params, session).send @method
  end

  def action
    get_class @path, 'action'
  end

end
