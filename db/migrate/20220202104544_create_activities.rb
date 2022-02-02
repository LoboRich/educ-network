class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :title
      t.string :instructions

      t.timestamps
    end
  end
end
