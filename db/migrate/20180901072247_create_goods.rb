class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :goods, :name
  end
end
