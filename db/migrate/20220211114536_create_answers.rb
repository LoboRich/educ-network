class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.boolean :answer
      t.integer :grading
      t.references :activity_submission, type: :uuid, null: false, foreign_key: true
      t.references :question, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
