json.extract! assignment_submission, :id, :assignment_id, :user_id, :body, :grade, :created_at, :updated_at
json.url assignment_submission_url(assignment_submission, format: :json)
