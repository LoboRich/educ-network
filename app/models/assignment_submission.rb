class AssignmentSubmission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  validates :user_id, presence: true
  
  has_one_attached :file
end
