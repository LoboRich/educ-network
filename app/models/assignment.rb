class Assignment < ApplicationRecord
  belongs_to :group
  has_many :assignment_submissions

  validates :title, presence: true
end
