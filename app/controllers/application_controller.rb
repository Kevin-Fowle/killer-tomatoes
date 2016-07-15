class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to new_session_path unless current_user
  end

  protect_from_forgery with: :exception
end
