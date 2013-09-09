class AddCityEtcToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :city, :string
  	add_column :teams, :city_abr, :string
  end
end
