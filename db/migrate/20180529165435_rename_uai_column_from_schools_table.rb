class RenameUaiColumnFromSchoolsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :schools, :uai, :commune
  end
end
