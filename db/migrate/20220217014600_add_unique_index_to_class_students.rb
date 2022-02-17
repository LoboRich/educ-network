class AddUniqueIndexToClassStudents < ActiveRecord::Migration[6.0]
  def change
    add_index :class_students, [:user_id, :group_id], unique: true
  end
end
