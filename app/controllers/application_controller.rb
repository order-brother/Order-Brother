class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  protect_from_forgery

  def user_not_authorized
    flash[:alert] = '權限不足'
    redirect_to(request.referrer || root_path)
  end

  # Setting strong parameters for user sign_in of devise gem
  def configure_permitted_parameters
    added_attrs = %i[phone email password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def default_pick_up_time(current_time = Time.zone.now + 30.minutes)
    current_time = Time.zone.parse(current_time)
    current_time ||= Time.zone.now + 30.minutes
    current_time.strftime("%Y-%m-%dT%H:%M")
  end
end
