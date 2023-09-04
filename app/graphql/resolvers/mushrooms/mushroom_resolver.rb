# frozen_string_literal: true

module Resolvers
  module Mushrooms
    class MushroomResolver < Resolvers::BaseResolver
      type Types::MushroomType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        mushroom = Mushroom.find_by(id: id)

        if mushroom.nil?
          # Return an error object with the error message
          return GraphQL::ExecutionError.new("The mushroom you entered does not exist in our database.")
        else
          mushroom
        end
      end
    end
  end
end

