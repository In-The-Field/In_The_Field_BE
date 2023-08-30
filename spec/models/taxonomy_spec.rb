require "rails_helper"

RSpec.describe Taxonomy, type: :model do
  describe "validations" do
    it { should validate_presence_of :genus }
    it { should validate_presence_of :order }
    it { should validate_presence_of :family }
    it { should validate_presence_of :phylum }
    it { should validate_presence_of :kingdom }
  end

  describe "relationships" do
    it { should belong_to :mushroom }
  end
end