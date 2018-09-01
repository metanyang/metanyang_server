class AddCenterIdToCenter < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :center_id, :string
  end
end
