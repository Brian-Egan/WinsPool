class AddUserChangesForHeroku < ActiveRecord::Migration
  def change
  	unless User.column_names.include? "sign_in_count"
  		add_column :users, :sign_in_count, :integer, :default => 0
  		add_column :users, :last_sign_in_at, :datetime 
  		remove_column :users, :name
  	end

  	if User.column_names.include? "last_sign_in_ip"
  		remove_column :users, :last_sign_in_ip
  		remove_column :users, :current_sign_in_ip
  		remove_column :users, :SignIns
  		remove_column :users, :current_sign_in_at
  		remove_column :users, :reset_password_token
  		remove_column :users, :reset_password_sent_at
  		remove_column :users, :remember_created_at
  	end

  end
end
