# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test', type: :request do
  it 'checks that the test page loads' do
    expect(true).to eq(true)
  end
end
