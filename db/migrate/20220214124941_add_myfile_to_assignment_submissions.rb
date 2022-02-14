class AddMyfileToAssignmentSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :assignment_submissions, :myfile, :string
  end
end
