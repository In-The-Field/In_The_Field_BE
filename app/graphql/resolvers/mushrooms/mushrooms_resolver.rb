# frozen_string_literal: true

module Resolvers
  module Mushrooms
    class MushroomsResolver < Resolvers::BaseResolver
      type [Types::MushroomType], null: false

      argument :image, String, required: true

      def resolve(image:)
        service = KindwiseService.new
        data = service.get_mushroom_data(image)

        case data
        when 'Invalid image data'
          return GraphQL::ExecutionError.new('Your submitted image was invalid')
        when '1'
          return GraphQL::ExecutionError.new('The specified api key does not have sufficient number of available credits')
        when '2'
          return GraphQL::ExecutionError.new('The specified api key not found')
        end

        mushrooms_data = data[:result][:classification][:suggestions]
        mushrooms = mushrooms_data.map do |mushroom_data|
          Match.new(mushroom_data)
        end

        all_mushrooms = []
        mushrooms.each do |mushroom|
          mush = Mushroom.find_by(latin_name: mushroom.latin_name)
          if !mush.nil?
            mush.update!(probability: mushroom.probability)
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
            new_mushroom.taxonomies.create!(
              {
                genus: mushroom.taxonomyp[:genus],
                order: mushroom.taxonomyp[:order],
                family: mushroom.taxonomyp[:family],
                phylum: mushroom.taxonomyp[:phylum],
                kingdom: mushroom.taxonomyp[:kingdom]
              }
            )

            new_mushroom.characteristics.create!(
              {
                hymenium_type: mushroom.characteristicp[:"hymenium type"],
                stipe_character: mushroom.characteristicp[:"stipe character"],
                spore_print_color: mushroom.characteristicp[:"spore print color"],
                mushroom_cap_shape: mushroom.characteristicp[:"mushroom cap shape"],
                hymenium_attachment: mushroom.characteristicp[:"hymenium attachment"],
                mushroom_ecological_type: mushroom.characteristicp[:"mushroom ecological type"]
              }
            )

            mushroom.look_alikep.map do |look_alike|
              new_mushroom.look_alikes.create!(
                {
                  url: look_alike[:url],
                  entity_id: look_alike[:entity_id],
                  name: look_alike[:name]
                }
              )
            end
            all_mushrooms << new_mushroom
          end
        end
        all_mushrooms
      end
    end
  end
end
