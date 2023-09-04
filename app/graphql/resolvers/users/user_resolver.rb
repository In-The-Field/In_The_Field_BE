# frozen_string_literal: true

module Resolvers
  module Users
    class UserResolver < Resolvers::BaseResolver
      type Types::UserType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        user = User.find_by(id:)

        return GraphQL::ExecutionError.new('The user you entered does not exist in our database.') if user.nil?

        # Return an error object with the error message

        user
      end
    end
  end
end
