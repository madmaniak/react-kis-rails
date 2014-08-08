class ActionsController < ApplicationController

  def router
    perform_action
    path = params[:url].gsub(/^api\//, '')
    redirect_to controller: 'serializations', action: 'router', path: path
  end

  private

  def perform_action
    @path = params[:path].split('/')
    method = @path.pop
    action.new(params, session).send method
  end

  def action
    get_class @path, 'action'
  end

end
