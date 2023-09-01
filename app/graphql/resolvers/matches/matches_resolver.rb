# frozen_string_literal: true

module Resolvers
  module Matches
    class MatchesResolver < Resolvers::BaseResolver
      type [Types::MatchType], null: false

      argument :image, String, required: true

      def resolve(image:)
        service = KindwiseService.new
        data = service.get_mushroom_data(image)
        matches_data = data[:result][:classification][:suggestions]
        matches_data.map do |match_data|
          Match.new(match_data)
        end
      end
    end
  end
end
