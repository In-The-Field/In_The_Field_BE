# require 'rails_helper'

# RSpec.describe Mutations::FavoriteMushroom do
#   def mutation_string(mushroom_id)
#     <<~GRAPHQL
#       mutation {
#         createUserMushroom(input: { mushroom_id: "#{mushroom_id}" }) {
#           userMushroom {
#             id
#             user {
#               id
#             }
#             mushroom {
#               id
#             }
#             is_saved 
#           }
#           errors
#         }
#       }
#     GRAPHQL
#   end

#   describe '#resolve', :vcr do
#     it 'creates a user_mushroom' do
#       user = create(:user)
#       mushroom = create(:mushroom)
      
#       post '/graphql', params: { query: mutation_string(mushroom.id) }

#       json_response = JSON.parse(response.body)
#       data = json_response['data']['favoriteMushroom']
#     end
#   end
# end

# require 'rails_helper'

# RSpec.describe Mutations::CreateUserMushroom do
#   def mutation_string(mushroom_id)
#     <<~GRAPHQL
#       mutation {
#         createUserMushroom(input: { mushroom_id: "#{mushroom_id}" }) {
#           createUserMushroom {
#             id
#             user {
#               id
#             }
#             mushroom {
#               id
#             }
#             is_saved 
#           }
#           errors
#         }
#       }
#     GRAPHQL
#   end

#   describe '#resolve', :vcr do
#     it 'creates a user_mushroom' do
#       user = create(:user)
#       mushroom = create(:mushroom)


      
#       result = InTheFieldBeSchema.execute(
#         mutation_string(mushroom.id),
#         context: { current_user: user }
#       )
      

#       data = result.dig('data','createUserMushroom')
#       expect(data['createUserMushroom']).to be_present
#       expect(data['errors']).to be_empty
#     end
#   end
# end