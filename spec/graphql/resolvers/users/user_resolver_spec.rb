require 'rails_helper'

RSpec.describe Resolvers::Users::UserResolver do
  describe '#resolve' do
    it 'fetches a user by ID' do
      user = User.create!(name: "Billy D.", email: "billyd@email.com")
  
      result = InTheFieldBeSchema.execute(
        <<~GRAPHQL
          query {
            user(id: "#{user.id}") {
              id
              name
              email
            }
          }
        GRAPHQL
      )

      expect(result['data']['user']).to include(
        'id' => user.id.to_s,
        'name' => user.name,
        'email' => user.email
      )
    end
  end
end

