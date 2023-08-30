# frozen_string_literal: true

module Types
  class MatchType < Types::BaseObject
    field :probability, Float, null: true

    field :psychoactive, Boolean, null: true

    field :api_id, String, null: true

    field :common_name, String, null: true

    field :latin_name, String, null: true
    field :edibility, String, null: true
    field :photo, String, null: true
    field :photo_citation, String, null: true
    field :description, String, null: true
    
    field :taxonomyp, Types::TaxonomypType, null: true
    field :characteristicp, Types::CharacteristicpType, null: true
    field :look_alikep, [Types::LookAlikepType], null: true
  end
end