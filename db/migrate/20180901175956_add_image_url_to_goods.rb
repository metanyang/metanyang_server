class AddImageUrlToGoods < ActiveRecord::Migration[5.1]
  def change
    add_column :goods, :image_url, :text
  end
end
