class CreateSponserships < ActiveRecord::Migration[5.1]
  def change
    create_table :sponserships do |t|
      t.string :email
      t.references :good, foreign_key: true
      t.references :center, foreign_key: true
      t.datetime :received_at

      t.timestamps
    end
  end
end
