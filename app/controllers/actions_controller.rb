class ActionsController < ApplicationController

  def router
    @path = params[:path].split('/')
    render action
  end

  private

  def action
    path = @path
    method = path.pop
    actions = Kernel.const_get (path.join('/') + "_action").camelize
    actions.new(params, session).send method
  end

end
