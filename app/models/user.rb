# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :user_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :user_mushrooms

  def saved_mushrooms
    x = self.user_mushrooms.where("is_saved = true")
    x.map do |user_mushroom|
      user_mushroom.mushroom
    end
  end
end
