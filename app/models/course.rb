class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 70 }
  validates :code, presence: true
  validates :credit_hours, presence: true
  validates :start_time, :end_time, presence: true
  validates :user_id, presence: true

  has_many :topics
  has_many :learning_objectives
  belongs_to :user

end