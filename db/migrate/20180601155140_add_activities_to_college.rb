class AddActivitiesToCollege < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :activities, :text, array: true, default: []
  end
end
