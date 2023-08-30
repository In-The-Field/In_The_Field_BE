module Resolvers
  module Mushrooms
    class MushroomsResolver < Resolvers::BaseResolver
      type [Types::MushroomType], null: false

      argument :image, String, required: true
      
      def resolve(image:)
        service = KindwiseService.new
        data = service.get_mushroom_data(image)
        mushrooms_data = data[:result][:classification][:suggestions]
        mushrooms = mushrooms_data.map do |mushroom_data|
          Match.new(mushroom_data)
        end
        all_mushrooms = []
        mushrooms.map do |mushroom|
          mush = Mushroom.find_by(api_id: mushroom.api_id)
          if !mush.nil?
            all_mushrooms << mush
          else
            new_mushroom = Mushroom.create!(
              {
                probability: mushroom.probability,
                psychoactive: mushroom.psychoactive,
                api_id: mushroom.api_id,
                common_name: mushroom.common_name,
                latin_name: mushroom.latin_name,
                edibility: mushroom.edibility,
                photo: mushroom.photo,
                photo_citation: mushroom.photo_citation,
                description: mushroom.description
              }
            )
            all_mushrooms << new_mushroom
          end
        end
        all_mushrooms
        # require 'pry'; binding.pry
      end
    end
  end
end