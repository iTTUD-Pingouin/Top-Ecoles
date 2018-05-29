class CreatePrimaires < ActiveRecord::Migration[5.2]
  def change
    create_table :primaires do |t|
      t.string :address
      t.integer :total_fees
      t.references :school, foreign_key: true
      t.text :sections, array: true, default: []
      t.text :options, array: true, default: []

      t.timestamps
    end
  end
end
