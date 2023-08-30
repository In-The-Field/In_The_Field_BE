class CreateLookAlikes < ActiveRecord::Migration[7.0]
  def change
    create_table :look_alikes do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.string :url
      t.string :entity_id
      t.string :name

      t.timestamps
    end
  end
end
