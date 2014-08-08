class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout false

  def index
  end

  private

  def get_class path_array, type = "type"
    Kernel.const_get (path_array.join('/') + "_#{type}").camelize
  end

end
