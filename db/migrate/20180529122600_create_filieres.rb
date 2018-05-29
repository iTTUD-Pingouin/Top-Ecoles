class CreateFilieres < ActiveRecord::Migration[5.2]
  def change
    create_table :filieres do |t|
      t.string :name
      t.float :success_rate
      t.float :mention_rate
      t.float :tb_mention_rate
      t.float :ab_mention_rate
      t.float :b_mention_rate
      t.float :churn_rate
      t.references :lycee, foreign_key: true
      t.string :serie

      t.timestamps
    end
  end
end
