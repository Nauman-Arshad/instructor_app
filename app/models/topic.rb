class Topic < ApplicationRecord
  validates :description, presence: true
  validates :course_id, presence: true
  
  has_many :learning_objective_topics
  has_many :learning_objectives, through: :learning_objectives_topics
  belongs_to :course


end