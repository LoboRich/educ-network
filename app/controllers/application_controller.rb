class ApplicationController < ActionController::Base
  rails g pundit:install
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :middle_name, :last_name, :role, :img, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :middle_name, :last_name, :role, :img, :email, :password, :current_password)}
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
 
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

end