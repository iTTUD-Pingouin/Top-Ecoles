class AddPhotoToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :photo, :string
  end
end
