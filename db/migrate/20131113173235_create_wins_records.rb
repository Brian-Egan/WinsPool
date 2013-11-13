class CreateWinsRecords < ActiveRecord::Migration
  def change
    create_table :wins_records do |t|
		t.integer :user_id
    	t.integer :ranking
    	t.decimal :win_percentage
    	t.integer :current_wk_ranking
    	t.integer :current_wk_wins
    	t.integer :current_wk_losses
    	t.decimal :current_wk_win_percentage
    	t.integer :last_wk_ranking
    	t.integer :last_wk_wins
    	t.integer :last_wk_losses
    	t.decimal :last_wk_win_percentage
      t.timestamps
    end
  end
end
