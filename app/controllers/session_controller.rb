class SessionController < ApplicationController
	
	def new
	end
	
   def login
    # raise params.inspect
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect to '/login', :alert => "Email/Password Incorrect!"
end
   end
  
	  def destroy
	  	session[:user_id] = nil
    	redirect_to '/login', :alert => "Successfully logged out!"
	  end
end
