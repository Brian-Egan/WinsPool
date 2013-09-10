class CreatePickOrders < ActiveRecord::Migration
  def change
    create_table :pick_orders do |t|
      t.integer :pick
      t.integer :teams_2
      t.integer :teams_3
      t.integer :teams_4
      t.integer :teams_5
      t.integer :teams_6
      t.integer :teams_7
      t.integer :teams_8
      t.integer :teams_9
      t.integer :teams_10
      t.integer :teams_11
      t.integer :teams_12
      t.integer :teams_13
      t.integer :teams_14
      t.integer :teams_15
      t.integer :teams_16
      t.timestamps
    end
  end
end
