class Post < ApplicationRecord
  validates :content, presence: true 
  belongs_to :class
  belongs_to :user
  has_many :comments
end
