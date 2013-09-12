class AddSignInsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :SignIns, :integer, :default => 0
  end
end
