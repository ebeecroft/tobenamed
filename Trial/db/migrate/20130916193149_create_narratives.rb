class CreateNarratives < ActiveRecord::Migration
  def change
    create_table :narratives do |t|
      t.integer :id
      t.integer :sub_id
      t.integer :user_id
      t.text :story
      t.date :created_on
      t.boolean :maintenance

      t.timestamps
    end
  end
end
