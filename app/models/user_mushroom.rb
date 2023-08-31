# frozen_string_literal: true

class UserMushroom < ApplicationRecord
  belongs_to :user
  belongs_to :mushroom
end
