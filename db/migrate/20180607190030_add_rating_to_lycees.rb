class AddRatingToLycees < ActiveRecord::Migration[5.2]
  def change
    add_column :lycees, :rating, :integer
  end
end
