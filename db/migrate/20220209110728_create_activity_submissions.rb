class CreateActivitySubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_submissions, id: :uuid do |t|

      t.timestamps
    end
  end
end
