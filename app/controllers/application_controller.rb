class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  # For APIs, you may want to use :null_session instead
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

	rescue_from ActiveRecord::RecordNotFound do
		flash[:warnings] = 'Resource not found'
		redirect_back_or root_path
	end

	def redirect_back_or(path)
		redirect_to request.referer || path
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_nickname, :email, :user_description, :city_id, :password, :user_avatar, :password_confirmation, genre_ids:[], skill_ids:[]) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:user_nickname, :email, :user_description, :city_id, :password, :user_avatar, :current_password, genre_ids:[], skill_ids:[]) }
  end

end
