
def setSchedCreatedAt
	numGames = Schedule.maximum('id')
	i = 1
	numGames += 1
	while i < numGames
		tm = Schedule.find(i)
		tm.created_at = Time.now
		tm.save
		i += 1
	end
end


def setTeamsCreatedAt
	numGames = Team.maximum('id')
	i = 1
	numGames += 1
	while i < numGames
		tm = Team.find(i)
		tm.created_at = Time.now
		tm.save
		i += 1
	end
end