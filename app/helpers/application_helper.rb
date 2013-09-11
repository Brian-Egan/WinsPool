module ApplicationHelper
	


	def formatAlerts(type, text)
		if type == :notice
			@class = "alert alert-success"
		elsif type == :warning
			@class = "alert alert-warning"
		elsif type == :info
			@class = "alert alert-info"
		elsif type == :alert || :error
			@class = "alert alert-danger"
		else
			@class = "alert alert-warning"
		end

		return @class

	end

	def setUser
		@auth_user = current_user
		return @auth_user
	end


end
	

