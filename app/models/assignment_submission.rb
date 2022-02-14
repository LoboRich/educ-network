class AssignmentSubmission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  validates :user_id, presence: true

  mount_uploader :myfile, ImgUploader
  
end
