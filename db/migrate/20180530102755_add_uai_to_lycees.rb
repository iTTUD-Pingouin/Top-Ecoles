class AddUaiToLycees < ActiveRecord::Migration[5.2]
  def change
    add_column :lycees, :uai, :string
  end
end
