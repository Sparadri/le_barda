class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.string :collection
      t.string :references,
      t.string :question
      t.string :string,
      t.string :answer
      t.string :string,
      t.string :placement
      t.string :string,
      t.string :picture
      t.string :string

      t.timestamps
    end
  end
end
