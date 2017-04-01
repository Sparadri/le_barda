class CreateNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletters do |t|
      t.string :email
      t.boolean :is_subscribed

      t.timestamps
    end
  end
end
