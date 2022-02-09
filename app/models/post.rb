class Post < ApplicationRecord
  validates :content, presence: true 

  belongs_to :user
  belongs_to :group
  has_many :comments
end
