def initialSetUp
	numUsers = User.count
	i = 0
	rankUsers = User.all.sort_by{|x| [x.wins, -x.losses]}.reverse
	# rankUsers.sort_by{|x| [x.wins, -x.losses]}.reverse
	while i < numUsers
		# if User.exists?(i)
		u = User.find(rankUsers[i].id)
		winP = u.wins.to_f/(u.wins.to_f + u.losses.to_f + u.ties.to_f)
		WinsRecord.create(user_id: u.id, ranking: (i + 1), win_percentage: winP, current_wk_ranking: i, games_back: (rankUsers[0].wins - u.wins) ,current_wk_wins: u.wins, current_wk_losses: u.losses, current_wk_games_back: 0, last_wk_ranking: 0,last_wk_wins: 0, last_wk_losses: 0,last_wk_win_percentage: nil, last_wk_games_back: 0)
		i += 1
	end
end

def setUpGamesBack
	numUsers = User.count
	i = 0
	rankUsers = User.all.sort_by{|x| [x.wins, -x.losses]}.reverse
	# rankUsers.sort_by{|x| [x.wins, -x.losses]}.reverse
	while i < numUsers
		u = User.find(rankUsers[i].id)
		r = u.wins_record
		r.games_back = (rankUsers[0].wins - u.wins)
		r.save
		i += 1
	end
end


