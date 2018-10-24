class ApplicationController < ActionController::Base
  # before_filter :authenticate_user!, unless: :api_request?
  protect_from_forgery with: :null_session
  
  def after_sign_in_path_for(resource)
    return '/common/index'
  end



  # def api_request?
  #   request.format.json?
  # end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end