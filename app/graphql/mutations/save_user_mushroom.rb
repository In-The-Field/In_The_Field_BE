# frozen_string_literal: true

module Mutations
  class SaveUserMushroom < Mutations::BaseMutation
    argument :user_id, ID, required: true
    argument :mushroom_id, ID, required: true

    field :user_mushroom, Types::UserMushroomsType, null: true
    field :user, Types::UserType, null: true
    field :mushroom, Types::MushroomType, null: true
    field :errors, [String], null: false # Set null: false here

    def resolve(user_id:, mushroom_id:)
      user = User.find_by(id: user_id)
      mushroom = Mushroom.find_by(id: mushroom_id)

      # Check if either user or mushroom is not found
      if user.nil? && mushroom.nil?
        return {
          errors: ['Both the user and mushroom you entered does not exist in our database.']
        }
      elsif user.nil? && !mushroom.nil?
        return {
          errors: ['The user you entered does not exist in our database.']
        }
      elsif !user.nil? && mushroom.nil?
        return {
          errors: ['The mushroom you entered does not exist in our database.']
        }
      end

      user_mushroom = UserMushroom.find_by(user_id:, mushroom_id:)

      # If userMushroom is not found, create a new one
      if user_mushroom.nil?
        user_mushroom = UserMushroom.new(user_id:, mushroom_id:, is_saved: true)
        if user_mushroom.save
          {
            user_mushroom:,
            user:,
            mushroom:,
            errors: []
          }
        else
          {
            user_mushroom: nil,
            user: nil,
            mushroom: nil,
            errors: ['Mushroom was not saved.']
          }
        end
      else
        # Toggle the is_saved attribute
        user_mushroom.is_saved = !user_mushroom.is_saved
        if user_mushroom.save
          {
            user_mushroom:,
            user:,
            mushroom:,
            errors: []
          }
        else
          {
            user_mushroom: nil,
            user: nil,
            mushroom: nil,
            errors: ['Sorry! We could update your Field Guide at this time, please try again later.']
          }
        end
      end
    end
  end
end
