class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :title
      t.string :instructions
      t.string :status
      t.datetime :due_date
      t.json :questions, default: '[]'
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
