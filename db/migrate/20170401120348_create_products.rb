class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :collection
      t.boolean :is_live
      t.string :name
      t.string :description
      t.float :price
      t.string :picture
      t.string :shop_url

      t.timestamps
    end
  end
end
