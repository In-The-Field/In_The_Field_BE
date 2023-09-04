# frozen_string_literal: true

module Types
  class UserMushroomsType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, UserType, null: true
    field :mushroom_id, MushroomType, null: true
    field :is_saved, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
