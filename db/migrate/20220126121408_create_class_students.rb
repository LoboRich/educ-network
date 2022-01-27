class CreateClassStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :class_students, id: :uuid do |t|
      t.uuid :group_id
      t.uuid :user_id
      t.string :status

      t.timestamps
    end
  end
end
