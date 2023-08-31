# frozen_string_literal: true

module Types
  class MushroomType < Types::BaseObject
    field :id, ID, null: false

    field :probability, Float, null: true

    field :psychoactive, Boolean, null: true

    field :api_id, String, null: true

    field :common_name, String, null: true

    field :latin_name, String, null: true
    field :edibility, String, null: true
    field :photo, String, null: true
    field :photo_citation, String, null: true
    field :description, String, null: true

    field :taxonomies, [Types::TaxonomyType], null: true
    field :characteristics, [Types::CharacteristicType], null: true
    field :look_alikes, [Types::LookAlikeType], null: true
  end
end
