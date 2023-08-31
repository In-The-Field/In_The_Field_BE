# frozen_string_literal: true

class CreateUserMushrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_mushrooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mushroom, null: false, foreign_key: true
      t.boolean :is_saved

      t.timestamps
    end
  end
end
