class CreateResultMails < ActiveRecord::Migration[5.1]
  def change
    create_table :result_mails do |t|
      t.references :sponsership, foreign_key: true
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
