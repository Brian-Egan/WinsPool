module SchedulesHelper


		def UpdateWLT(usr)
			usr.wins = usr.ws
			usr.losses = usr.ls
			usr.ties = usr.ties
			usr.save
	end


end
