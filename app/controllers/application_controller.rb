class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
  helper_method :current_user

  def require_authentication
    if current_user.nil?
      redirect_to login_path, alert: "Please log in to continue"
    end
  end
end
