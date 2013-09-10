numBooks = Schedule.count
i = 1
while i < numBooks + 1
	if Schedule.exists?(i) && Schedule.find(i).winning_team_id != nil
		bk = Schedule.find(i)
		bk.visitor_score = nil
		bk.home_score = nil
		bk.winning_team_id = nil
		if bk.created_at.nil?
			bk.created_at = Time.now
		end
		bk.save
	end
	
	i += 1
end