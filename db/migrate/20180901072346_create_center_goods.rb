class CreateCenterGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :center_goods do |t|
      t.references :center, foreign_key: true
      t.references :good, foreign_key: true

      t.timestamps
    end
  end
end
