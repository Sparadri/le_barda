class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.references :collection
      t.string :question
      t.string :answer
      t.string :placement
      t.string :picture

      t.timestamps
    end
  end
end
