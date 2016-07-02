class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :avatar, :member, :profile, :works)
    devise_parameter_sanitizer.for(:account_update).push(:name, :avatar, :member, :profile, :works)
  end
end
