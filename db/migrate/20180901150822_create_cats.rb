class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :cat_id
      t.references :center, foreign_key: true
      t.text :thumbnail_url
      t.text :image_url

      t.timestamps
    end
    add_index :cats, :cat_id
  end
end
