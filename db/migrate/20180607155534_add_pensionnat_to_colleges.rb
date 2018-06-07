class AddPensionnatToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :pensionnat, :boolean
  end
end
