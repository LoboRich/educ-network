class ActivitySubmission < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  has_many :answers, inverse_of: :activity_submission
  accepts_nested_attributes_for :answers
end
