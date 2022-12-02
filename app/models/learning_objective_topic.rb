class LearningObjectiveTopic < ApplicationRecord
  self.table_name = "learning_objectives_topics"
  validates :topic_id, presence: true
  validates :learning_objective_id, presence: true

  belongs_to :learning_objective
  belongs_to :topic

end