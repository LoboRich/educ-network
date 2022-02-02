class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments, id: :uuid do |t|
      t.string :title
      t.string :instructions
      t.references :group, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
