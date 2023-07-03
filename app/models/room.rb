class Room < ApplicationRecord
    mount_uploader :img, ImageUploader
    belongs_to :user
    has_many :reservation

end
