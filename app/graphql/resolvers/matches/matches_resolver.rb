module Resolvers
  module Matches
    class MatchesResolver < Resolvers::BaseResolver
      type [Types::MatchType], null: false

      argument :image, String, required: true
      
      def resolve(image:)
        service = KindwiseService.new
        data = service.get_mushroom_data(image)
        matches_data = data[:result][:classification][:suggestions]
        matches = matches_data.map do |match_data|
          Match.new(match_data)
        end
        matches
      end
    end
  end
end