class BloomTaxonomyVerb < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: [:name, :bloom_taxonomy_level_id] }

  validates :bloom_taxonomy_level_id, presence: true

  belongs_to :bloom_taxonomy_level

end