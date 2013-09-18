class SessionController < ApplicationController
	
	def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
	end
	
   def login
    # raise params.inspect
    unless User.find_by_email(params[:email]).nil?
      user = User.find_by_email(params[:email])
    end


    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.sign_in_count += 1
      user.last_sign_in_at = Time.now
      user.save
      redirect_to '/standings'
    else
      @user = User.new
      respond_to do |format|
        format.html { redirect_to '/login', :alert => "Email/Password Incorrect!"}
        format.js
      end
end
   end
  
	  def destroy
	  	session[:user_id] = nil
    	redirect_to '/login', :alert => "Successfully logged out!"
	  end
end
