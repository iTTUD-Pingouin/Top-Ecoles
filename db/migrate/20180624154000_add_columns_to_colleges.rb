class AddColumnsToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :name, :string
    add_column :colleges, :cp, :integer
  end
end
