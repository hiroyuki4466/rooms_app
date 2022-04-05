class Room < ApplicationRecord
  has_one_attached :room_image
  has_one_attached :user_image
  belongs_to :user
  has_many :reservations, dependent: :destroy, foreign_key: 'room_id'
  validates :room_name, presence: true, length: {maximum:30}
  validates :introduction, presence: true, length: {maximum:150}
  validates :price, presence: true, numericality: {only_integer: true}
  validates :address, presence: true
  validates :room_image, presence:true
  
  def self.search(area)
    Room.where(['address LIKE ?', "%#{area}%"])
  end

  def self.search(key)
    Room.where(['room_name LIKE ? OR address LIKE ? OR price LIKE ?', "%#{key}%", "%#{key}%", "%#{key}%"]) 
  end
end
