class AddCommuneToPrimaire < ActiveRecord::Migration[5.2]
  def change
    add_column :primaires, :commune, :string
  end
end
