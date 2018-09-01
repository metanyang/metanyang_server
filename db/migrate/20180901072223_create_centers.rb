class CreateCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :centers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :description

      t.timestamps
    end
    add_index :centers, :name
  end
end
