require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :request do
  def mutation_string(name, email)
    <<~GRAPHQL
      mutation {
        createUser(input: { name: "#{name}", email: "#{email}" }) {
          user {
            name
            email
          }
          errors
        }
      }
    GRAPHQL
  end

  describe '#resolve' do
    it 'creates a user' do
      name = 'Test User'
      email = 'test@example.com'
      
      post '/graphql', params: { query: mutation_string(name, email) }
      
      json_response = JSON.parse(response.body)
      data = json_response['data']['createUser']
      
      expect(data).to include(
        'user' => {
          'name' => name,
          'email' => email
        },
        'errors' => []
      )
    end
  end
end
