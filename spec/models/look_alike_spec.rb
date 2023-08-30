require "rails_helper"

RSpec.describe LookAlike, type: :model do
  describe "validations" do
    it { should validate_presence_of :url }
    it { should validate_presence_of :entity_id }
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should belong_to :mushroom }
  end
end