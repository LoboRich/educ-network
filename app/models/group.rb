class Group < ApplicationRecord
    mount_uploader :img, ImgUploader
    belongs_to :user
    has_many :class_students
    has_many :posts
    has_many :assignments
end
