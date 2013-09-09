class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
      t.integer :ties
      t.integer :owner_id

      t.timestamps
    end
  end
end
