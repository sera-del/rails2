class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  has_many :rooms
  has_many :reservations
  mount_uploader :user_img, ImageUploader
  validates :username, :email, presence: true 
  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true
end
