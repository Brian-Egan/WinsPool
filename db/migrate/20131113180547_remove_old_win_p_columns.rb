class RemoveOldWinPColumns < ActiveRecord::Migration
  def change
  	remove_column :users, :current_wk_win_percentage
  	remove_column :users, :last_wk_win_percentage
  end
end
