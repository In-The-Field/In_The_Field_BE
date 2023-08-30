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
        mushrooms.map do |mushroom|
          # require 'pry'; binding.pry
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
          # new_mushroom.update!(latin_name: "Bob")
        end
        require 'pry'; binding.pry
      end
    end
  end
end