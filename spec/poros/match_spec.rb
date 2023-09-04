# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Match do
  describe '#initialize' do
    it 'initializes with correct attributes' do
      data = {
        probability: 0.8,
        details: {
          psychoactive: true,
          common_names: ['Common Name'],
          edibility: 'Edible',
          image: {
            value: 'image_url',
            citation: 'Image Citation'
          },
          description: {
            value: 'Description text'
          }
        },
        id: '12345',
        name: 'Latin Name'
      }

      match = Match.new(data)

      expect(match.probability).to eq(0.8)
      expect(match.psychoactive).to eq(true)
      expect(match.api_id).to eq('12345')
      expect(match.common_name).to eq('Common Name')
      expect(match.latin_name).to eq('Latin Name')
      expect(match.edibility).to eq('Edible')
      expect(match.photo).to eq('image_url')
      expect(match.photo_citation).to eq('Image Citation')
      expect(match.description).to eq('Description text')
      expect(match.taxonomy).to eq({
        genus: "nil",
        order: "nil",
        family: "nil",
        phylum: "nil",
        kingdom: "nil"
      })
      expect(match.characteristics).to eq({
        "hymenium type" => "nil",
        "stipe character" => "nil",
        "spore print color" => "nil",
        "mushroom cap shape" => "nil",
        "hymenium attachment" => "nil",
        "mushroom ecological type" => "nil"
      })
      expect(match.look_alikes).to eq(['nil'])
    end
  end
end
