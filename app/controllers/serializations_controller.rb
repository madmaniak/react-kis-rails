class SerializationsController < ApplicationController

  before_filter :split_path, only: :router

  def router
    route
  end

  private

  def route
    if @path.size.even?
      render json: serializer.send(:show, params, @method), serializer: serializer
    else
      render json: serializer.send(:index, params), each_serializer: serializer, root: @name
    end
  rescue NameError
    raise ActionController::RoutingError.new('Not Found')
  end

  def serializer
    @serializer ||= (
      path = @path
      @name = path.pop
      path << @name.singularize
      get_class path, 'serializer'
    )
  end

  def get_class path_array, type = "type"
    Kernel.const_get (path_array.join('/') + "_#{type}").camelize
  end

  def split_path path = params[:path]
    @path = path.split('/')
    @method = @path.pop if @path.size > 1
  end

end
