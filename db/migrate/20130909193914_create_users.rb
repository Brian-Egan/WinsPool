class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :owner
      t.integer :draft_order

      t.timestamps
    end
  end
end
