# require 'Schedule'
numGames = Schedule.maximum('id')
i = 1
numGames += 1
# while i < numGames

Schedule.all.each do |s|
	# gm = Schedule.find(i)
	d = s.date.to_formatted_s(:db)
	d[0] = ""
	d = "2" + d
	d = d.to_datetime
	s.date = d
	s.save
	# i += 1
	end
