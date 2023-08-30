class CreateCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristics do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.string :hymenium_type
      t.string :stipe_character
      t.string :spore_print_color
      t.string :mushroom_cap_shape
      t.string :hymenium_attachment
      t.string :mushroom_ecological_type

      t.timestamps
    end
  end
end
