class User < ApplicationRecord
  has_one_attached :user_image
  has_many :reservations, dependent: :destroy, foreign_key: 'user_id'
  has_many :rooms, dependent: :destroy, foreign_key: 'user_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
