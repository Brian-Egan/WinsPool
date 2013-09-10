numBooks = Team.count
i = 1
while i < numBooks + 1
	if Team.exists?(i)
		bk = Team.find(i)
		bk.wins = 0
		bk.losses = 0
		bk.ties = 0
		if bk.created_at.nil?
			bk.created_at = Time.now
		end
		bk.save
	end
	
	i += 1
end