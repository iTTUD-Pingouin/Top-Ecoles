class AddRatingToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :rating, :integer
  end
end
