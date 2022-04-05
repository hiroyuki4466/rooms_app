class Reservation < ApplicationRecord
  has_one_attached :room_image
  belongs_to :room
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true, numericality: true
  validate :start_end_check
  validate :date_before_start

  def start_end_check
    errors.add(:end_date, "は開始日以降で選択してください") unless
    start_date == nil || end_date == nil || start_date < end_date 
  end
  
  def date_before_start
    errors.add(:start_date, "は本日以降で選択してください")if start_date != nil && end_date != nil && start_date < Date.today
  end
  
  def total_days
    (self.end_date - self.start_date).to_i
  end

  def total_price
    self.total_days.to_i * self.number_of_people.to_i * self.room.price
  end
end
