class FixUserModel < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	add_column :users, :email, :string
  	add_column :users, :
  end
end
