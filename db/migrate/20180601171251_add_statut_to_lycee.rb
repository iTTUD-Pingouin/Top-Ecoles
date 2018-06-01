class AddStatutToLycee < ActiveRecord::Migration[5.2]
  def change
    add_column :lycees, :statut, :string
  end
end
