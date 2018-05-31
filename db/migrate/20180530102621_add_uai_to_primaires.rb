class AddUaiToPrimaires < ActiveRecord::Migration[5.2]
  def change
    add_column :primaires, :uai, :string
  end
end
