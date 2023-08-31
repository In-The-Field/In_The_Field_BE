# frozen_string_literal: true

class Taxonomy < ApplicationRecord
  validates_presence_of :genus
  validates_presence_of :order
  validates_presence_of :family
  validates_presence_of :phylum
  validates_presence_of :kingdom

  belongs_to :mushroom
end
