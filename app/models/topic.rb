class Topic < ApplicationRecord
  validates :description, presence: true
  validates :course_id, presence: true
  
  has_many :learning_objective_topics
  has_many :learning_objectives, through: :learning_objectives_topics
  belongs_to :course
  before_create :set_map_topics


  def set_map_topics
    if Topic.last.present?
      @x = Topic.last.map_topics
    else
      @x = "0".to_i
    end
    @x = @x + 1
    self.map_topics = @x
  end
end