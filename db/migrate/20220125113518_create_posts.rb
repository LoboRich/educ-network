class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :content
      t.uuid :group_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
