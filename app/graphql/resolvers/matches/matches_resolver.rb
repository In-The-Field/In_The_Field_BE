module Resolvers
  module Matches
    class MatchesResolver < Resolvers::BaseResolver
      type [Types::MatchType], null: false

      argument :image, String, required: true
      
      def resolve(image:)
        service = KindwiseService.new
        data = service.get_mushroom_data(image)
        # access_token = data[:access_token]
        matches_data = data[:result][:classification][:suggestions]
        matches = matches_data.map do |match_data|
          # require 'pry'; binding.pry
          Match.new(match_data)
        end
        matches
        # require 'pry'; binding.pry
      end
    end
  end
end