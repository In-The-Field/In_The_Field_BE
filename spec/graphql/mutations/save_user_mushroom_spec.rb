# frozen_string_literal: true

require 'rails_helper'

module Mutations
  RSpec.describe SaveUserMushroom, type: :request do
    # describe 'resolve' do
    #   it 'unsaves/saves a user mushroom', :vcr do
    #     user = create(:user)
    #     mushroom = create(:mushroom)
    #     user_mushroom = create(:user_mushroom, user_id: user.id, mushroom_id: mushroom.id, is_saved: true)

    #     query = <<~GQL
    #       mutation($user_id: ID!, $mushroom_id: ID!) {
    #         saveUserMushroom(user_id: $user_id, mushroom_id: $mushroom_id) {
    #           userMushroom {
    #             isSaved
    #           }
    #           user {
    #             id
    #           }
    #           mushroom {
    #             id
    #           }
    #           errors
    #         }
    #       }

    #       GQL

    #     variables = {
    #       user_id: user.id,
    #       mushroom_id: mushroom.id
    #     }

    #     result = InTheFieldBeSchema.execute(query, variables: variables)
    # expect(result["data"]["saveUserMushroom"]["userMushroom"]["isSaved"]).to be(false)
    #   end
    # end
  end
end
