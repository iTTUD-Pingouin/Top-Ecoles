class AddColumnsToFilieres < ActiveRecord::Migration[5.2]
  def change
    add_column :filieres, :fullname, :string

    # 2015 rates
    add_column :filieres, :succes_rate_2015, :float
    add_column :filieres, :succes_rate_without_mention_2015, :float
    add_column :filieres, :succes_rate_AB_mention_2015, :float
    add_column :filieres, :succes_rate_B_mention_2015, :float
    add_column :filieres, :succes_rate_TB_mention_2015, :float

    # 2016 rates
    add_column :filieres, :succes_rate_2016, :float
    add_column :filieres, :succes_rate_without_mention_2016, :float
    add_column :filieres, :succes_rate_AB_mention_2016, :float
    add_column :filieres, :succes_rate_B_mention_2016, :float
    add_column :filieres, :succes_rate_TB_mention_2016, :float

    # 2017 rates
    add_column :filieres, :succes_rate_2017, :float
    add_column :filieres, :succes_rate_without_mention_2017, :float
    add_column :filieres, :succes_rate_AB_mention_2017, :float
    add_column :filieres, :succes_rate_B_mention_2017, :float
    add_column :filieres, :succes_rate_TB_mention_2017, :float

  end
end
