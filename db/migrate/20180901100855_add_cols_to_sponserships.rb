class AddColsToSponserships < ActiveRecord::Migration[5.1]
  def change
    add_column :sponserships, :name, :string
    add_column :sponserships, :address, :string
    add_column :sponserships, :s_count, :string
    add_column :sponserships, :s_weight, :string
  end
end
