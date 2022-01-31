class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :title
      t.text :instructions
      t.uuid :group_id
      t.jsonb :question
      t.string :classification

      t.timestamps
    end
  end
end
