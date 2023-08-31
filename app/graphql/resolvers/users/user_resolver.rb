# frozen_string_literal: true

module Resolvers
  module Users
    class UserResolver < Resolvers::BaseResolver
      type Types::UserType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        User.find_by(id:)
      end
    end
  end
end
