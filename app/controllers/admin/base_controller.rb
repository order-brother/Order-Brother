module Admin
  class BaseController < ApplicationController
    include Pundit

    # layout 'admin/application' # uncomment if different layout from frontend demanding.
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # Setting strong parameters for user sign_in of devise gem
    def configure_permitted_parameters
      added_attrs = [:phone, :email, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  end
end