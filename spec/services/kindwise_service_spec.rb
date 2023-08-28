require "rails_helper"

RSpec.describe KindwiseService do
  describe '#call' do
    it 'returns a hash of mushroom data', :vcr do
      base_64_image
      mushrooms = KindwiseService.new
      mushroom_results = mushrooms.get_mushroom_data(@image)
    
      expect(mushroom_results).to be_a(Hash)
      expect(mushroom_results).to have_key(:access_token)
      expect(mushroom_results).to have_key(:input)
      expect(mushroom_results[:input]).to have_key(:images)
      expect(mushroom_results[:input][:images]).to be_an(Array)
      expect(mushroom_results[:input][:images].first).to be_a(String)
      expect(mushroom_results[:input]).to have_key(:similar_images)
      expect(mushroom_results[:input][:similar_images]).to be(true)
      expect(mushroom_results).to have_key(:result)
      expect(mushroom_results[:result]).to be_a(Hash)
      expect(mushroom_results[:result]).to have_key(:classification)
      expect(mushroom_results[:result][:classification]).to have_key(:suggestions)
      expect(mushroom_results[:result][:classification][:suggestions]).to be_an(Array)
      expect(mushroom_results[:result][:classification][:suggestions].first).to be_a(Hash)
      expect(mushroom_results[:result][:classification][:suggestions].first).to have_key(:id)
      expect(mushroom_results[:result][:classification][:suggestions].first).to have_key(:name)
      expect(mushroom_results[:result][:classification][:suggestions].first[:name]).to be_a(String)
      expect(mushroom_results[:result][:classification][:suggestions].first).to have_key(:probability)
      expect(mushroom_results[:result][:classification][:suggestions].first[:probability]).to be_a(Float)
      expect(mushroom_results[:result][:classification][:suggestions].first).to have_key(:details)
      expect(mushroom_results[:result][:classification][:suggestions].first[:details]).to have_key(:common_names)
      expect(mushroom_results[:result][:classification][:suggestions].first[:details][:common_names]).to be_an(Array)
    end
  end
end