def showTable(users)
	lines = "-----"
	puts "==================================================="
	puts "|  Rank  |   Name   |   W   |   L   |   ID   |    "
	puts "----------------------------------------------------"
	i = 1
	users.each do |u|
		puts "----------------------------------------------------"
		puts "|  #{i}   |   #{u.owner}   |  #{u.wins}  |  #{u.losses}  |  #{u.id}  |"
		i += 1
	end
end


