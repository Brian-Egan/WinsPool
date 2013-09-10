class AddOverallPick < ActiveRecord::Migration
  def change
  	add_column :drafts, :overall_pick, :integer
  end
end
