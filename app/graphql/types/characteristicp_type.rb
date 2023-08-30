# frozen_string_literal: true

module Types
  class CharacteristicpType < Types::BaseObject
    field :hymenium_type, String, null: true
    field :stipe_character, String, null: true
    field :spore_print_color, String, null: true
    field :mushroom_cap_shape, String, null: true
    field :hymenium_attachment, String, null: true
    field :mushroom_ecological_type, String, null: true
  end
end
