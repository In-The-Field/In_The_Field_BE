class CreateTaxonomies < ActiveRecord::Migration[7.0]
  def change
    create_table :taxonomies do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.string :genus
      t.string :order
      t.string :family
      t.string :phylum
      t.string :kingdom

      t.timestamps
    end
  end
end
