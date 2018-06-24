class AddAllColumnsToColleges < ActiveRecord::Migration[5.2]
  def change
    add_column :colleges, :code_commune, :integer
    add_column :colleges, :departement, :string
    add_column :colleges, :code_departement, :integer
    add_column :colleges, :academie, :string
    add_column :colleges, :region, :string
    add_column :colleges, :latitude, :integer
    add_column :colleges, :longitude, :integer
    add_column :colleges, :telephone, :integer
    add_column :colleges, :website, :string
    add_column :colleges, :has_restauration, :boolean, default: false
    add_column :colleges, :has_hebergement, :boolean, default: false
    add_column :colleges, :has_ulis, :boolean, default: false
    add_column :colleges, :has_apprentissage, :boolean, default: false
    add_column :colleges, :has_segpa, :boolean, default: false
    add_column :colleges, :has_art_section, :boolean, default: false
    add_column :colleges, :has_cinema_section, :boolean, default: false
    add_column :colleges, :has_theatre_section, :boolean, default: false
    add_column :colleges, :has_sport_section, :boolean, default: false
    add_column :colleges, :has_international_section, :boolean, default: false
    add_column :colleges, :has_european_section, :boolean, default: false
    add_column :colleges, :has_agricole_section, :boolean, default: false
    add_column :colleges, :has_military_section, :boolean, default: false
    add_column :colleges, :has_metiers_section, :boolean, default: false
    add_column :colleges, :has_post_bac_sections, :boolean, default: false
    add_column :colleges, :is_educ_priority_zone, :boolean, default: false
    add_column :colleges, :students_number, :integer
    add_column :colleges, :onisep_view, :string
    add_column :colleges, :main_photo, :string
    add_column :colleges, :logo, :string
    add_column :colleges, :photo1, :string
    add_column :colleges, :photo2, :string
    add_column :colleges, :photo3, :string
    add_column :colleges, :photo4, :string
    add_column :colleges, :photo5, :string
    add_column :colleges, :photo6, :string
    add_column :colleges, :video1, :string
    add_column :colleges, :video2, :string
    add_column :colleges, :description_etablissement, :string
  end
end
