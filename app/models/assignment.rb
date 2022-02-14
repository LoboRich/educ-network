class Assignment < ApplicationRecord
  belongs_to :group
  has_many :assignment_submissions, dependent: :delete_all

  validates :title, presence: true
end
