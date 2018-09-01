class CreateSidos < ActiveRecord::Migration[5.1]
  def change
    create_table :sidos do |t|
      t.string :sido_id
      t.string :name

      t.timestamps
    end
    add_index :sidos, :sido_id
  end
end
