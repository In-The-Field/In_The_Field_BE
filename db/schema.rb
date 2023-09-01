# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_830_175_823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'characteristics', force: :cascade do |t|
    t.bigint 'mushroom_id', null: false
    t.string 'hymenium_type'
    t.string 'stipe_character'
    t.string 'spore_print_color'
    t.string 'mushroom_cap_shape'
    t.string 'hymenium_attachment'
    t.string 'mushroom_ecological_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['mushroom_id'], name: 'index_characteristics_on_mushroom_id'
  end

  create_table 'look_alikes', force: :cascade do |t|
    t.bigint 'mushroom_id', null: false
    t.string 'url'
    t.string 'entity_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['mushroom_id'], name: 'index_look_alikes_on_mushroom_id'
  end

  create_table 'mushrooms', force: :cascade do |t|
    t.float 'probability'
    t.boolean 'psychoactive'
    t.string 'api_id'
    t.string 'common_name'
    t.string 'latin_name'
    t.string 'edibility'
    t.string 'photo'
    t.string 'photo_citation'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'taxonomies', force: :cascade do |t|
    t.bigint 'mushroom_id', null: false
    t.string 'genus'
    t.string 'order'
    t.string 'family'
    t.string 'phylum'
    t.string 'kingdom'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['mushroom_id'], name: 'index_taxonomies_on_mushroom_id'
  end

  create_table 'user_mushrooms', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'mushroom_id', null: false
    t.boolean 'is_saved'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['mushroom_id'], name: 'index_user_mushrooms_on_mushroom_id'
    t.index ['user_id'], name: 'index_user_mushrooms_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'characteristics', 'mushrooms'
  add_foreign_key 'look_alikes', 'mushrooms'
  add_foreign_key 'taxonomies', 'mushrooms'
  add_foreign_key 'user_mushrooms', 'mushrooms'
  add_foreign_key 'user_mushrooms', 'users'
end
