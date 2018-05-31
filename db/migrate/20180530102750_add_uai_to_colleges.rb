class AddUaiToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :uai, :string
  end
end
