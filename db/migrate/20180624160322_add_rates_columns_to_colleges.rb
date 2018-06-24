class AddRatesColumnsToColleges < ActiveRecord::Migration[5.2]
  def change
    # 2015 rates
    add_column :colleges, :succes_rate_2015, :integer
    add_column :colleges, :succes_rate_without_mention_2015, :integer
    add_column :colleges, :succes_rate_AB_mention_2015, :integer
    add_column :colleges, :succes_rate_B_mention_2015, :integer
    add_column :colleges, :succes_rate_TB_mention_2015, :integer

    # 2016 rates
    add_column :colleges, :succes_rate_2016, :integer
    add_column :colleges, :succes_rate_without_mention_2016, :integer
    add_column :colleges, :succes_rate_AB_mention_2016, :integer
    add_column :colleges, :succes_rate_B_mention_2016, :integer
    add_column :colleges, :succes_rate_TB_mention_2016, :integer

    # 2017 rates
    add_column :colleges, :succes_rate_2017, :integer
    add_column :colleges, :succes_rate_without_mention_2017, :integer
    add_column :colleges, :succes_rate_AB_mention_2017, :integer
    add_column :colleges, :succes_rate_B_mention_2017, :integer
    add_column :colleges, :succes_rate_TB_mention_2017, :integer
  end
end
