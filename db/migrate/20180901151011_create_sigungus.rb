class CreateSigungus < ActiveRecord::Migration[5.1]
  def change
    create_table :sigungus do |t|
      t.string :sigungu_id
      t.string :name
      t.references :sido, foreign_key: true

      t.timestamps
    end
    add_index :sigungus, :sigungu_id
  end
end
