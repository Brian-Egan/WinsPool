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

	def AddLoss(team)
		@team = Team.find(team)
		@team.losses += 1
		@team.save
	end


	def AddWin(team)
		@team = Team.find(team)
		@team.wins += 1
		@team.save
	end

	def RemoveWin(team)
		@team = Team.find(team)
		@team.wins -= 1
		@team.save
	end

	def RemoveLoss(team)
		@team = Team.find(team)
		@team.losses -= 1
		@team.save
	end

	def SetTeamRecords(winner, loser)
		@wTeam = Team.find(winner)
		@wTeam.wins += 1
		@wTeam.save
		@lTeam = Team.find(loser)
		@lTeam.losses += 1
		@lTeam.save
		puts "Set Team Records Helper!"
	end

	def AdjustTeamRecords(winner, loser)
		@wTeam = Team.find(winner)
		@wTeam.wins -= 1
		@wTeam.save
		@lTeam = Team.find(loser)
		@lTeam.losses -= 1
		@lTeam.save
		puts "Adjust Team Records Helper!"
	end

	def SetTeamTies(home, visitor)
		@hTeam = Team.find(winner)
		@hTeam.ties += 1
		@hTeam.save
		@hTeam = Team.find(loser)
		@hTeam.ties += 1
		@hTeam.save
		puts "Set Team Ties Helper!"
	end
end

