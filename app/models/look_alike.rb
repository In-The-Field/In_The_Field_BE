class LookAlike < ApplicationRecord
  validates :url, presence: true
  validates :entity_id, presence: true
  validates :name, presence: true

  belongs_to :mushroom
end