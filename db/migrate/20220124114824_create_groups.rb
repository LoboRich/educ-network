class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups, id: :uuid do |t|
      t.string :img
      t.uuid :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
