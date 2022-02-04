class Activity < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :instructions, presence: true
end
