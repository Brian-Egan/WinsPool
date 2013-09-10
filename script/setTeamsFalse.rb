numBooks = Team.count
i = 1
while i < numBooks + 1
	if Team.exists?(i)
		bk = Team.find(i)
		bk.taken = false
		bk.save
	end
	
	i += 1
end