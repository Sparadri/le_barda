class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.references :collectioner
      t.boolean :is_live
      t.string :name
      t.text :description
      t.string :color_dark
      t.string :color_light
      t.string :avatar
      t.string :pictures_interview
      t.string :pictures_shooting

      t.timestamps
    end
  end
end
