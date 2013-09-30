class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def error_404
    render text: 404
  end

  protected

  def login_required
    if current_user.blank?
      flash[:message] = t("common.login_required")
      redirect_to new_user_session_path
    else
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :avatar, :password, :password_confirmation) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar, :password, :password_confirmation) }
  end

end
