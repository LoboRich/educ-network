class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :kind, default: 'True or False'
      t.string :query_question
      t.boolean :correct_answer
      t.references :activity, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
