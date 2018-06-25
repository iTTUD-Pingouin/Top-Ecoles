class ChangeIntegerColumnsToFloatInColleges < ActiveRecord::Migration[5.2]
  def change


    change_column :colleges, :telephone, :string
    change_column :colleges, :code_commune, :string
    change_column :colleges, :code_departement, :string

    # 2015 colleges rates
    change_column :colleges, :succes_rate_2015, :float
    change_column :colleges, :succes_rate_without_mention_2015, :float
    change_column :colleges, :succes_rate_AB_mention_2015, :float
    change_column :colleges, :succes_rate_B_mention_2015, :float
    change_column :colleges, :succes_rate_TB_mention_2015, :float

    # 2016 colleges rates
    change_column :colleges, :succes_rate_2016, :float
    change_column :colleges, :succes_rate_without_mention_2016, :float
    change_column :colleges, :succes_rate_AB_mention_2016, :float
    change_column :colleges, :succes_rate_B_mention_2016, :float
    change_column :colleges, :succes_rate_TB_mention_2016, :float

    # 2017 colleges rates
    change_column :colleges, :succes_rate_2017, :float
    change_column :colleges, :succes_rate_without_mention_2017, :float
    change_column :colleges, :succes_rate_AB_mention_2017, :float
    change_column :colleges, :succes_rate_B_mention_2017, :float
    change_column :colleges, :succes_rate_TB_mention_2017, :float



    change_column :lycees, :telephone, :string
    change_column :lycees, :code_departement, :string
    change_column :lycees, :code_commune, :string

  end
end
