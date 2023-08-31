# frozen_string_literal: true

class Characteristic < ApplicationRecord
  # validates :hymenium_type, presence: true
  # validates :stipe_character, presence: true
  # validates :spore_print_color, presence: true
  # validates :mushroom_cap_shape, presence: true
  # validates :hymenium_attachment, presence: true
  # validates :mushroom_ecological_type, presence: true

  belongs_to :mushroom
end
