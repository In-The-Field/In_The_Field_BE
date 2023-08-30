require "rails_helper"

RSpec.describe Characteristic, type: :model do
  describe "validations" do
    it { should validate_presence_of :hymenium_type}
    it { should validate_presence_of :stipe_character}
    it { should validate_presence_of :spore_print_color}
    it { should validate_presence_of :mushroom_cap_shape}
    it { should validate_presence_of :hymenium_attachment}
    it { should validate_presence_of :mushroom_ecological_type}
  end

  describe "relationships" do
    it { should belong_to :mushroom }
  end
end