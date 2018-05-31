class AddCommuneToLycee < ActiveRecord::Migration[5.2]
  def change
    add_column :lycees, :commune, :string
  end
end
