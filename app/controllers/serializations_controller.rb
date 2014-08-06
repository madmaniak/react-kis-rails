class SerializationsController < ApplicationController

  def router
    @path = params[:path].split('/')
    if @path.size.even?
      id = @path.pop
      render json: serializer.send(:show, view_context, id), serializer: serializer
    else
      render json: serializer.send(:index, view_context), each_serializer: serializer
    end
  rescue NameError
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def serializer
    @serializer ||= (
      path = @path
      path[-1] = path[-1].singularize + "_serializer"
      Kernel.const_get path.join.camelize
    )
  end

end
