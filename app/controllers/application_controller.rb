class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :setUser
  before_filter :authenticate_user!

 #  if current_user.exists?
 # 	 @auth_user = current_user
 # end

end
