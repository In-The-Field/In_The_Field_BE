class Mushroom < ApplicationRecord
  validates :probability, presence: true
  validates :api_id, presence: true
  validates :common_name, presence: true
  validates :latin_name, presence: true
  validates :photo, presence: true
  validates :photo_citation, presence: true
  validates :description, presence: true

  has_many :user_mushrooms
  has_many :users, through: :user_mushrooms
  has_many :characteristics, dependent: :destroy
  has_many :taxonomies, dependent: :destroy
  has_many :look_alikes, dependent: :destroy
end