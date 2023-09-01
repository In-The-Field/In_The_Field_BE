# frozen_string_literal: true

module Resolvers
  module Mushrooms
    class MushroomResolver < Resolvers::BaseResolver
      type Types::MushroomType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        Mushroom.find_by(id:)
      end
    end
  end
end
