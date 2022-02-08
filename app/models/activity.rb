class Activity < ApplicationRecord
  belongs_to :group
  has_many :questions, inverse_of: :activity
  accepts_nested_attributes_for :questions

  validates :title, presence: true
end