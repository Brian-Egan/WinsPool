class FixUpUserTableForHeroku < ActiveRecord::Migration
  def change
  	unless User.column_names.include? "email"
  	add_column :users, :email, :string
  		add_column :users, :password_digest, :string
  	end
  end
end
