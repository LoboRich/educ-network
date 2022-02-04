class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :title
      t.string :kind, default: 'Quiz'
      t.text :instructions
      t.string :status, default: 'Unassigned'
      t.datetime :due_date
      t.references :group, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
