module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :users, resolver: Resolvers::Users::UsersResolver
    field :user, resolver: Resolvers::Users::UserResolver
    field :matches, resolver: Resolvers::Matches::MatchesResolver
    field :mushrooms, resolver: Resolvers::Mushrooms::MushroomsResolver

    # field :user, Types::UserType, null: true do 
    #   argument :id, ID, required: true
    # end

    # def user(id:)
    #   User.find_by(id: id)
    # end

  end
end
