class Group < ApplicationRecord
    validates :name , presence: true 
    validates :description, presence: true

    mount_uploader :img, ImgUploader
    belongs_to :user
    has_many :class_students
    has_many :posts
    has_many :assignments, dependent: :delete_all
    has_many :activities
end
