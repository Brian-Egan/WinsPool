class Team < ActiveRecord::Base

has_one :draft
has_one :user, :through => :draft


	# def games
 #        where("schedules.home_id = ?", self.id) + where("schedules.visitor_id = ?", self.id)
 #    end

	# def self.winz
	# 	@wins = Schedule.where(:winning_team_id => self.id).count
	# 	return @wins
	# end

	def self.avail
		where(:taken => false)
	end

	def self.gone
		where(:taken => true)
	end

	

	# def self.game(wk)
	# 	gm = Schedule.where(:visitor_id => self.id, :week => wk)

	# 	if gm.empty?
	# 		gm = Schedule.where(:home_id => self.id, :week => wk)
	# 	end

	# 	if gm.empty?
	# 		gm = "Bye"
	# 	end

 #    	return gm
 #   	end

 scope :game, -> { where(Schedule.where(:visitor_id => self.id).all) }


   def self.created_before(time)
    where("created_at < ?", time)
  end

  def self.road_game(week)
  	return Schedule.where(:visitor_id => self.id).all
  end

  def self.r_game(week)
  	return Schedule.where(visitor_id: self.id).all
  end

end



# 	has_one :draft
# 	has_one :team, :through => :draft

# 	def self.avail
# 		where(:taken => false)
# 	end

# 	def self.gone
# 		where(:taken => true)
# 	end


# 	def self.titles
#     	return Player.where(taken: true).all
#    	end
# end