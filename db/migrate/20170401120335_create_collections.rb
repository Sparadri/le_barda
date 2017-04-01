class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :collectioner
      t.string :references,
      t.string :is_live
      t.string :boolean,
      t.string :name
      t.string :string,
      t.string :color_dark
      t.string :string,
      t.string :color_light
      t.string :string,
      t.string :main_cover_picture
      t.string :string,
      t.string :interview_cover_picture
      t.string :string,
      t.string :profile_picture
      t.string :string

      t.timestamps
    end
  end
end
