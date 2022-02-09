class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :middle_name, :last_name, :role, :img, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :middle_name, :last_name, :role, :img, :email, :password, :current_password)}
    end

    def user_not_authorized
      # flash[:alert] = "You are not authorized to perform this action."
      # redirect_to(request.referrer || root_path)
      redirect_to "/access_denied"
    end

end