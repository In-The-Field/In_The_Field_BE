# frozen_string_literal: true

module Types
  class TaxonomypType < Types::BaseObject
    field :genus, String, null: true
    field :order, String, null: true
    field :family, String, null: true
    field :phylum, String, null: true
    field :kingdom, String, null: true
  end
end