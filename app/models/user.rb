class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 70 }
  validates :address, presence: true, length: { minimum: 3 }
  validates :phone_no, presence: true
  # validates :office_hours, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  # before_save :total_time
  has_many :courses

  # def total_time
  #   time1 = Time.now
  #   time2 = self.created_at || Time.now - 1 * 60
  #   minutes = time_diff(time1, time2)
  #   self.total_time = Time.at((minutes) * 60).utc.strftime("%H:%M:%S")
  # end
  #
  # private
  #
  # def time_diff(start_time, end_time)
  #   (start_time - end_time) / 60
  # end

end