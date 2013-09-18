class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :id
      t.integer :petown_id
      t.integer :monster_id
      t.integer :round
      t.integer :damage
      t.boolean :miss

      t.timestamps
    end
  end
end
