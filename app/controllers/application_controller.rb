class ApplicationController < ActionController::Base
  include Pundit
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  protected

  def user_not_authorized
    flash[:alert] = '權限不足'
    redirect_to(request.referrer || root_path)
  end

  # Setting strong parameters for user sign_in of devise gem
  def configure_permitted_parameters
    added_attrs = [:phone, :email, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
