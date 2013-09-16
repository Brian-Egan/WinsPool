module UsersHelper

	def UpdateAllUserWLT
		User.all.each do |u|
			u.wins = u.ws
			u.losses = u.ls
			u.ties = u.ties
			u.save
		end
	end

	def UpdateUserWLT(usr)
			usr.wins = usr.ws
			usr.losses = usr.ls
			usr.ties = usr.ties
			usr.save
	end

end
