class Mushroom < ApplicationRecord
  validates :probability, presence: true
  validates :psychoactive, presence: true
  validates :api_id, presence: true
  validates :common_name, presence: true
  validates :latin_name, presence: true
  validates :edibility, presence: true
  validates :photo, presence: true
  validates :photo_citation, presence: true
  validates :description, presence: true

  has_many :user_mushrooms
  has_many :mushrooms, through: :user_mushrooms
  has_one :characteristic, dependent: :destroy
  has_one :taxonomy, dependent: :destroy
  has_one :look_alike, dependent: :destroy

end