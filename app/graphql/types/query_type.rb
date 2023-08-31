module Types
  class QueryType < Types::BaseObject
   
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, resolver: Resolvers::Users::UsersResolver
    field :user, resolver: Resolvers::Users::UserResolver
    field :matches, resolver: Resolvers::Matches::MatchesResolver
  end
end
