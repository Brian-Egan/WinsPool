class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :get_logged_in_user
  
  def get_logged_in_user
    if session[:user_id]
      @auth_user = User.find(session[:user_id])
    else
      @auth_user = nil
    end
	end

end
