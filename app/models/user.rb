class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
  validates :address, presence: true, length: { minimum: 3 }
  validates :phone_no, presence: true
  # validates :office_hours, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  # before_save :total_time
  has_many :courses

end