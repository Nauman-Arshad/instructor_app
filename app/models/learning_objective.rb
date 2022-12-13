class LearningObjective < ApplicationRecord
  enum category: %w[must important good]
  validates :description, presence: true, length: { minimum: 3 }
  validates :course_id, presence: true
  validates :bloom_taxonomy_level_id, presence: true
  validates :bloom_taxonomy_verb_id, presence: true
  validate :premium_category
  before_create :make_unique_key
  after_destroy :update_topic
  has_many :learning_objectives_topics
  has_many :topics, through: :learning_objectives_topics
  belongs_to :bloom_taxonomy_level
  belongs_to :course
  BLOOM_TAXONOMY_LEVEL = { 1 => 'Remember', 2 => 'Understand', 3 => 'Apply', 4 => 'Analyze', 5 => 'Evaluate', 6 => 'Create' }.freeze
  scope :remember, -> { where(bloom_taxonomy_level_id: 1) }
  scope :understand, -> { where(bloom_taxonomy_level_id: 2) }
  scope :apply, -> { where(bloom_taxonomy_level_id: 3) }
  scope :analyze, -> { where(bloom_taxonomy_level_id: 4) }
  scope :evaluate, -> { where(bloom_taxonomy_level_id: 5) }
  scope :creat, -> { where(bloom_taxonomy_level_id: 6) }

  # Temporary One because JS has to be added on BLOOM_TAXONOMY LEVEL CLICK
  BLOOM_TAXONOMY_VERB = { '1': [[1, 'Remember_1'], [2, 'Remember_2']], '2': [[3, 'Understand_1'], [4, 'Understand_2']] }.freeze

  VERIFICATION_KEYWORDS = %w[and or understand comprehend know].freeze

  def premium_category
    error = false
    VERIFICATION_KEYWORDS.each do |keyword|
      if self.description.downcase.split.include?(keyword)
        error = true
        errors.add(:base, "Error description cannot contain (#{keyword.upcase()}) LO is not saved!")
      end
    end
    if error
      throw :abort
    end
    true
  end

  def make_unique_key
    if LearningObjective.last.present?
      x = LearningObjective.last.id
    else
      x = "0".to_i
    end
    x = "LO" + "#{x + 1}"
    self.key = x
  end

  def update_topic
    Topic.all.map do |topic|
      if topic.map_topics&.include?(self.key)
        topic.map_topics.delete(self.key)
        if topic.map_topics.empty?
          topic.map_topics == []
        end
        topic.save
      end
    end
  end
end