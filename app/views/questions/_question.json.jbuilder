json.extract! question, :id, :kind, :content, :created_at, :updated_at
json.url question_url(question, format: :json)
