# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Match do
  describe '#initialize' do
    it 'initializes with correct attributes' do
      data = {
        probability: 0.37,
        details: {
          psychoactive: nil,
          common_names: ["Frost's Amanita"],
          taxonomy: { genus: "Amanita", order: "Agaricales", family: "Amanitaceae", phylum: "Basidiomycota", kingdom: "Fungi" },
          edibility: nil,
          look_alike: nil,
          image: {
            value: 'image_url',
            citation: 'Image Citation'
          },
          description: {
            value: 'Description text'
          }
        },
        id: '12345',
        name: "Amanita frostiana"
      }

      match = Match.new(data)

      expect(match.probability).to eq(0.37)
      expect(match.psychoactive).to eq(nil)
      expect(match.api_id).to eq('12345')
      expect(match.common_name).to eq("Frost's Amanita")
      expect(match.latin_name).to eq("Amanita frostiana")
      expect(match.edibility).to eq(nil)
      expect(match.photo).to eq('image_url')
      expect(match.photo_citation).to eq('Image Citation')
      expect(match.description).to eq('Description text')
      expect(match.taxonomyp).to eq({
        genus: "Amanita",
        order: "Agaricales",
        family: "Amanitaceae",
        phylum: "Basidiomycota",
        kingdom: "Fungi"
      })
      expect(match.characteristicp).to eq({})
      expect(match.look_alikep).to eq([])
    end
  end
end
