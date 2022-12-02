class CreateBloomTaxonomyLevel < ActiveRecord::Migration[6.0]
  def change
    create_table :bloom_taxonomy_levels do |t|
      t.string :level, null: false
    end
  end
end
