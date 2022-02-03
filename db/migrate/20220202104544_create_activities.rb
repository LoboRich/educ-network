class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :title
      t.string :instructions
      t.string :status
      t.datetime :due_date

      t.timestamps
    end
  end
end
