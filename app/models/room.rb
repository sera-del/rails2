class Room < ApplicationRecord
    mount_uploader :img, ImageUploader
    belongs_to :user
    has_many :reservation
    validates :accommodation, :accommodation_detail, presence: true
    validates :price, presence: true, numericality: true
    validates :address, presence: true
end
