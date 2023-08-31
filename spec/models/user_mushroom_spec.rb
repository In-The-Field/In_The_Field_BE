# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMushroom, type: :model do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:mushroom) }
  end
end
