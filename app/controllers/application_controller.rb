class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:locale, :name, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:locale, :name, :email, :password, :current_password)}
    end

    def switch_locale(&action)
      locale = current_user.try(:locale) || I18n.default_locale
      I18n.with_locale(locale, &action)
    end
end