class AddAvailToTeam < ActiveRecord::Migration
  def change
  	add_column :teams, :taken, :boolean
  end
end
