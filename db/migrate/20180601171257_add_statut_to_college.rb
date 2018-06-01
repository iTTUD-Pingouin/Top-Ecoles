class AddStatutToCollege < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :statut, :string
  end
end
