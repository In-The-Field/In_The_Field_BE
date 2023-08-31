# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Users::UsersResolver do
  describe '#resolve' do
    it 'fetches all users' do
      user_1 = User.create!(name: 'Billy D.', email: 'billyd@email.com')
      User.create!(name: 'Sally D.', email: 'sallyd@email.com')
      User.create!(name: 'Sunny D.', email: 'sunnyd@email.com')

      result = InTheFieldBeSchema.execute(
        <<~GRAPHQL
          {
            users {
              id
              name
              email
            }
          }
        GRAPHQL
      )

      result['data']['users'].each do |user|
        expect(user).to be_a Hash

        expect(user).to have_key 'id'
        expect(user['id']).to be_a String

        expect(user).to have_key 'name'
        expect(user['name']).to be_a String

        expect(user).to have_key 'email'
        expect(user['email']).to be_a String
      end

      expect(result['data']['users'].first['id']).to eq(user_1.id.to_s)
      expect(result['data']['users'].first['name']).to eq(user_1.name)
      expect(result['data']['users'].first['email']).to eq(user_1.email)
    end
  end
end
