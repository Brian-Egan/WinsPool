module SchedulesHelper


		def UpdateWLT(usr)
			usr.wins = usr.ws
			usr.losses = usr.ls
			usr.ties = usr.ties
			usr.save
	end


	def getGameStatus(date)
		if Time.now() > date && (Time.now - date) < 100000
			@color = "text-warning"
		elsif Time.now() > date
			@color = "text-danger"
		else
			@color = ""
		end

		return @color
		end


end
