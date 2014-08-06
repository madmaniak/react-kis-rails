class SerializationsController < ApplicationController

  def router
    @path = params[:path].split('/')
    if @path.size.even?
      id = @path.pop
      render json: serializer.send(:show, params, id), serializer: serializer
    else
      render json: serializer.send(:index, params), each_serializer: serializer, root: @name
    end
  rescue NameError
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def serializer
    @serializer ||= (
      path = @path
      @name = path[-1]
      path[-1] = @name.singularize + "_serializer"
      Kernel.const_get path.join.camelize
    )
  end

end
