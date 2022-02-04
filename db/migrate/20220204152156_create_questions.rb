class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :kind
      t.json :content

      t.timestamps
    end
  end
end
