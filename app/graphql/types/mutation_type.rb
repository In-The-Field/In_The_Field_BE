# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    field :create_user, mutation: Mutations::CreateUser
    field :save_user_mushrooms, mutation: Mutations::SaveUserMushroom
  end
end
