class AddCommuneToCollege < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :commune, :string
  end
end
