# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mushroom, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :probability }
    # it { should validate_presence_of :api_id }
    # it { should validate_presence_of :common_name }
    # it { should validate_presence_of :latin_name }
    # it { should validate_presence_of :photo }
    # it { should validate_presence_of :photo_citation }
    # it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should have_many :user_mushrooms }
    it { should have_many(:users).through(:user_mushrooms) }
    it { should have_many :characteristics }
    it { should have_many :taxonomies }
    it { should have_many :look_alikes }
  end
end
