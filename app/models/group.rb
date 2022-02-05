class Group < ApplicationRecord
    belongs_to :user
    has_many :class_students
    has_many :posts
    has_many :assignments
end
