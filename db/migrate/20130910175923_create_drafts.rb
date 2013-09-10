class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.integer :round
      t.integer :pick
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end
end
