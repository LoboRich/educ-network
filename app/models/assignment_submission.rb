class AssignmentSubmission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  
  has_one_attached :file
end
