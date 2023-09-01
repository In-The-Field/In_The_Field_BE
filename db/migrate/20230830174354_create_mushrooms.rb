# frozen_string_literal: true

class CreateMushrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :mushrooms do |t|
      t.float :probability
      t.boolean :psychoactive
      t.string :api_id
      t.string :common_name
      t.string :latin_name
      t.string :edibility
      t.string :photo
      t.string :photo_citation
      t.string :description

      t.timestamps
    end
  end
end
