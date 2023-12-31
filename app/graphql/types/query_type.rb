# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, resolver: Resolvers::Users::UsersResolver
    field :user, resolver: Resolvers::Users::UserResolver
    field :matches, resolver: Resolvers::Matches::MatchesResolver
    field :mushrooms, resolver: Resolvers::Mushrooms::MushroomsResolver
    field :mushroom, resolver: Resolvers::Mushrooms::MushroomResolver
  end
end
