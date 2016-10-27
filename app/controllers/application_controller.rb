class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_filter :set_locale
  before_filter :authenticate_user!

  def get_user
    @current_user = session[:current_user]
  end

  layout :load_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :login) }
  end

  def load_layout
    devise_controller? ? "login" : "application"
  end

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
