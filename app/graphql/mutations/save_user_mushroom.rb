class Mutations::SaveUserMushroom < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :mushroom_id, ID, required: true
  

  field :user_mushroom, Types::UserMushroomsType, null: false
  field :user, Types::UserType, null: false
  field :mushroom, Types::MushroomType, null: false
  field :errors, [String], null: false

  def resolve(user_id:, mushroom_id:)
    user = User.find(user_id)
    mushroom = Mushroom.find(mushroom_id)
    user_mushroom = UserMushroom.find_by(user_id: user_id, mushroom_id: mushroom_id)
    if !user_mushroom.nil?
      if user_mushroom.is_saved == true
        user_mushroom.update(is_saved: false)
      elsif user_mushroom.is_saved == false
        user_mushroom.update(is_saved: true)
      end
      {
        user_mushroom: user_mushroom,
        user: user,
        mushroom: mushroom,
        errors: []
      }
    else
      user_mushroom = UserMushroom.new(user_id: user_id, mushroom_id: mushroom_id, is_saved: true)
      if  user_mushroom.save
        {
          user_mushroom: user_mushroom,
          user: user,
          mushroom: mushroom,
          errors: []
        }
      else
        {
          user_mushroom: nil,
          errors: user.errors.full_messages
      }
      end
    end
  end
end