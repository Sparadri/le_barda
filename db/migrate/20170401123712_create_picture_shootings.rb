class CreatePictureShootings < ActiveRecord::Migration[5.0]
  def change
    create_table :picture_shootings do |t|
      t.references :collection
      t.string :url

      t.timestamps
    end
  end
end
