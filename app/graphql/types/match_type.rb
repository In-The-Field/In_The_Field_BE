# frozen_string_literal: true

module Types
  class MatchType < Types::BaseObject
    field :probability, Integer, null: true

    field :psychoactive, Boolean, null: true

    field :api_id, String, null: true
    field :common_name, String, null: true
    field :latin_name, String, null: true
    field :edibility, String, null: true
    field :photo, String, null: true
    field :photo_citation, String, null: true
    field :description, String, null: true
    
    field :taxonomy, Types::TaxonomyType, null: true
    field :characteristic, Types::CharacteristicType, null: true
    field :look_alike, [Types::LookAlikeType], null: true
  end
end