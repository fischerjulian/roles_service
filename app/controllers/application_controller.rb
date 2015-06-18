class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_to_referer(options)
    redirect_to URI(request.referer).path, options
  end
end
