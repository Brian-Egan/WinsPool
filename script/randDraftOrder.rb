@numGames =  User.count
@i = 1
	while @i < @numGames + 1
		@users = User.all(:order => "RANDOM()")
		@x = 0
		@y = 1
		while @x < @numGames
			@u = @users[@x]
			@u.draft_order = @y
			@u.save
			@y += 1
			@x += 1
		end
		@i += 1

	end

