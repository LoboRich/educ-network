class CreateActivitySubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_submissions, id: :uuid do |t|
      t.boolean :answer
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :activity, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
