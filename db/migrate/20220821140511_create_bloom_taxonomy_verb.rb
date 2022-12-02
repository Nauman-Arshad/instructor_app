class CreateBloomTaxonomyVerb < ActiveRecord::Migration[6.0]
  def change
    create_table :bloom_taxonomy_verbs do |t|
      t.string :name, null: false
    end
    add_reference :bloom_taxonomy_verbs, :bloom_taxonomy_level, index: true
  end
end
