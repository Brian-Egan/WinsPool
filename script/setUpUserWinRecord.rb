numUsers = User.count
i = 0
rankUsers = User.all.sort_by{|x| [x.wins, -x.losses]}.reverse
# rankUsers.sort_by{|x| [x.wins, -x.losses]}.reverse
while i < numUsers
	# if User.exists?(i)
	u = User.find(rankUsers[i].id)
	winP = u.wins.to_f/(u.wins.to_f + u.losses.to_f + u.ties.to_f)
	WinsRecord.create(user_id: u.id, ranking: (i + 1), win_percentage: winP, current_wk_ranking: i, current_wk_wins: u.wins, current_wk_losses: u.losses, last_wk_ranking: 0,last_wk_wins: 0, last_wk_losses: 0,last_wk_win_percentage: nil)
	i += 1
end


