# frozen_string_literal: true

module Types
  class LookAlikeType < Types::BaseObject
    field :url, String, null: false
    field :entity_id, String, null: false
    field :name, String, null: false
  end
end
