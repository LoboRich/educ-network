class ClassStudent < ApplicationRecord

    belongs_to :group
    belongs_to :user
    validates :user_id, uniqueness: { scope: :group_id, message: "Student already exists for this class." }

    enum statuses: {
		'Pending': 'Pending',
		'Joined': 'Joined'
	}

  def my_submission(activity)
    student = User.where(id: self.user_id).first
    submission = student.activity_submissions.where(activity_id: activity.id)
  end

  def my_score(activity)
    student = User.where(id: self.user_id).first
    score = student.activity_submissions.where(activity_id: activity.id).first.answers.sum(:grading)
    overall = activity.questions.sum(:grading)

    return (score.to_s + " / " + overall.to_s)
  end
end
