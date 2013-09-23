numWks = 17
i = 1
oneWeek = (7*24*60*60)
wkDuration = oneWeek - 1
	while i < numWks
		wk = Week.new
		wk.weekNum = i
		if i == 1
			wk.start_date = (Schedule.find(1).date - (60*60*60))
		else
			x = i - 1
			lastWk = Week.find(x)
			wk.start_date = lastWk.start_date + oneWeek
		end
		wk.end_date = wk.start_date + wkDuration
		wk.save
		i += 1
	end

