class User < ActiveRecord::Base

has_many :teams, :through => :drafts 

has_many :drafts

	def self.teamz
		self.drafts.each do |d|
			return d.player_id
		end
	end

	def wins
		return self.teams.sum(:wins)
	end

	def losses
		return self.teams.sum(:losses)
	end

	def ties
		return self.teams.sum(:ties)
	end

	def win_percent
		@games = self.wins.to_f + self.losses.to_f + self.ties.to_f
		return self.wins.to_f/@games
	end


	    # has_many :books, :through => :recommendations do
     #  def saved
     #    where("recommendations.self_saved = ?", true)
     #  end

     #  def sent
     #    where("recommendations.self_saved = ?", false) + where("recommendations.received = ?", false)
     #  end

     #  def received
     #    where("recommendations.received = ?", true)
     #  end

     #  def incoming
     #    where("recommendations.self_saved = ?", true) + where("recommendations.received = ?", true)
     #  end

     #  def active
     #    where("recommendations.active = ?", true)
     #  end

     #  def inactive
     #    where("recommendations.active = ?", false)
     #  end





end
