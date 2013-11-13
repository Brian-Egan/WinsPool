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

	def updateUserRankings(users)
		rankings = users.sort_by{|x| [x.wins, -x.losses]}.reverse
		i = 0
		while i < rankings.count
			u = rankings[i]
			u.wins_record.ranking = (i + 1)
			u.wins_record.games_back = (rankings[0].wins - u.wins)
			u.wins_record.save
			i += 1
		end
	end

	def setUsersForNewWeek(users)
		# rankings = User.by_rank
		i = 0
		while i < users.count
			u = users[i]
			# User.all.each do |u|
			winP = u.wins.to_f/(u.wins.to_f + u.losses.to_f + u.ties.to_f)
			r = u.wins_record
			r.last_wk_losses = r.current_wk_losses 
			r.last_wk_wins = r.current_wk_wins
			r.last_wk_ranking = r.current_wk_ranking
			r.last_wk_games_back = r.current_wk_games_back
			r.current_wk_losses = u.losses
			r.current_wk_wins = u.wins
			r.current_wk_games_back = r.games_back
			r.current_wk_ranking = r.ranking
			r.win_percentage = winP
			r.games_back = (users[0].wins - u.wins)
			r.ranking = i + 1
			r.save
			i += 1
		end

		end

	def getRankingChange(user)
		change = user.wins_record.last_wk_ranking - user.wins_record.ranking
			if change > 0
				@position = "<small class='xxsmall-text vertical-align-super text-success'>+#{change}</small>"
			elsif change == 0
					# @position = "<small class='xxsmall-text vertical-align-super'>--</small>"
					@position = ""
			elsif change < 0
				@position = "<small class='xxsmall-text vertical-align-super text-danger'>#{change}</small>"
			else
				@position = ""
			end
		return @position.html_safe
	end

	def getWinsChange(user)
		change = user.wins - user.wins_record.last_wk_wins
			if change > 0
				@position = "<small class='xxsmall-text vertical-align-super text-success'>+#{change}</small>"
			elsif change == 0
					# @position = "<small class='xxsmall-text vertical-align-super'>--</small>"
					@position = ""
			elsif change < 0
				@position = "<small class='xxsmall-text vertical-align-super text-danger'>#{change}</small>"
			else
				@position = ""
			end
		return @position.html_safe
	end

	def getLossesChange(user)
		change = user.losses - user.wins_record.last_wk_losses 
			if change > 0
				@position = "<small class='xxsmall-text vertical-align-super text-danger'>+#{change}</small>"
			elsif change == 0
					# @position = "<small class='xxsmall-text vertical-align-super'>--</small>"
					@position = ""
			elsif change < 0
				@position = "<small class='xxsmall-text vertical-align-super text-danger'>#{change}</small>"
			else
				@position = ""
			end
		return @position.html_safe
	end

	def getGamesBackChange(user)
		change = user.wins_record.last_wk_games_back - user.wins_record.games_back
			if change > 0
				@position = "<small class='xxsmall-text vertical-align-super text-success'>+#{change}</small>"
			elsif change == 0
					@position = "<small class='xxsmall-text vertical-align-super'>--</small>"
			elsif change < 0
				@position = "<small class='xxsmall-text vertical-align-super text-danger'>#{change}</small>"
			else
				@position = ""
			end
		return @position.html_safe
	end
		


end
