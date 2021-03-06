class Activity < ApplicationRecord
  belongs_to :group
  has_many :questions, inverse_of: :activity
  accepts_nested_attributes_for :questions
  has_many :activity_submissions

  validates_presence_of :title
  validates_presence_of :instructions
end
