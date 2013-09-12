class GetRidOfNameOnHeroku < ActiveRecord::Migration
  def change
  	if User.column_names.include? "SignIns"
  		remove_column :users, :SignIns
  	end
  	
  end
end
