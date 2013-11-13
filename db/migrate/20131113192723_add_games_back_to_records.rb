class AddGamesBackToRecords < ActiveRecord::Migration
  def change
  	add_column :wins_records, :games_back, :integer, :default => 0
  	add_column :wins_records, :current_wk_games_back, :integer, :default =>  0
  	add_column :wins_records, :last_wk_games_back, :integer, default: 0
  end
end
