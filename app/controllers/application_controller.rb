class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:studentNumber])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:studentName])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:bankName])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:bankAccount])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:grade])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:departmentId])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:authorization])
    end
end
