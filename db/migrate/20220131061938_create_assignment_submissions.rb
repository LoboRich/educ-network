class CreateAssignmentSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_submissions, id: :uuid do |t|
      t.references :assignment, null: false, foreign_key: true,  type: :uuid
      t.references :user, null: false, foreign_key: true,  type: :uuid
      t.text :body
      t.float :grade

      t.timestamps
    end
  end
end
