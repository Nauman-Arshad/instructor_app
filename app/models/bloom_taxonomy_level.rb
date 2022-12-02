class BloomTaxonomyLevel < ApplicationRecord
  validates :level, presence: true, uniqueness: true

  has_many :bloom_taxonomy_verbs
  has_many :learning_objective
  BLOOM_TAXONOMY_LEVEL = ['Remember', 'Understand', 'Apply', 'Analyze', 'Evaluate', 'Create'].freeze
end