module UsersHelper

	def UpdateAllUserWLT
		User.all.each do |u|
			u.wins = u.ws
			u.losses = u.ls
			u.ties = u.ties
			u.save
		end
	end

	def UpdateUserWLT(usr)
			usr.wins = usr.ws
			usr.losses = usr.ls
			usr.ties = usr.ties
			usr.save
	end

	def getUserWinPercent(w, l, t)
		if w > 0 || l > 0 || t > 0
			@games = w + l + t
			@WinP = (w.to_f/@games.to_f)*1000
			if @WinP == 1000
				@wP = "1.000"
			elsif @WinP > 0 
				# @wP = "." + number_to_percentage(@WinP, precision: 0)
				# @WinP = @WinP.to_i
				@wP = ".#{@WinP.to_i}"
			else
				@wP = ".000"
			end
		else 
			@wP = ".000"
		end

			return @wP

	end
		


end
