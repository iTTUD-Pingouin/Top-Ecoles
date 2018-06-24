class AddAllColumnsToLycees < ActiveRecord::Migration[5.2]
  def change
    add_column :lycees, :name, :string
    add_column :lycees, :cp, :integer

    add_column :lycees, :code_commune, :integer
    add_column :lycees, :departement, :string
    add_column :lycees, :code_departement, :integer
    add_column :lycees, :academie, :string
    add_column :lycees, :region, :string
    add_column :lycees, :latitude, :integer
    add_column :lycees, :longitude, :integer
    add_column :lycees, :telephone, :integer
    add_column :lycees, :website, :string


    add_column :lycees, :has_general_way, :boolean, default: false
    add_column :lycees, :has_techno_way, :boolean, default: false
    add_column :lycees, :has_pro_way, :boolean, default: false

    add_column :lycees, :has_ES_serie, :boolean, default: false
    add_column :lycees, :has_S_serie, :boolean, default: false
    add_column :lycees, :has_L_serie, :boolean, default: false
    add_column :lycees, :has_bacpro_production_serie, :boolean, default: false
    add_column :lycees, :has_bacpro_service_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_TMD_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_STHR_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_STMG_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_STL_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_STAV_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_ST2S_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_STI2D_serie, :boolean, default: false
    add_column :lycees, :has_bactechno_STD2A_serie, :boolean, default: false

    add_column :lycees, :has_restauration, :boolean, default: false
    add_column :lycees, :has_hebergement, :boolean, default: false
    add_column :lycees, :has_ulis, :boolean, default: false
    add_column :lycees, :has_apprentissage, :boolean, default: false
    add_column :lycees, :has_segpa, :boolean, default: false
    add_column :lycees, :has_art_section, :boolean, default: false
    add_column :lycees, :has_cinema_section, :boolean, default: false
    add_column :lycees, :has_theatre_section, :boolean, default: false
    add_column :lycees, :has_sport_section, :boolean, default: false
    add_column :lycees, :has_international_section, :boolean, default: false
    add_column :lycees, :has_european_section, :boolean, default: false
    add_column :lycees, :has_agricole_section, :boolean, default: false
    add_column :lycees, :has_military_section, :boolean, default: false
    add_column :lycees, :has_metiers_section, :boolean, default: false
    add_column :lycees, :has_post_bac_sections, :boolean, default: false
    add_column :lycees, :is_educ_priority_zone, :boolean, default: false
    add_column :lycees, :students_number, :integer
    add_column :lycees, :onisep_view, :string
    add_column :lycees, :main_photo, :string
    add_column :lycees, :logo, :string
    add_column :lycees, :photo1, :string
    add_column :lycees, :photo2, :string
    add_column :lycees, :photo3, :string
    add_column :lycees, :photo4, :string
    add_column :lycees, :photo5, :string
    add_column :lycees, :photo6, :string
    add_column :lycees, :video1, :string
    add_column :lycees, :video2, :string
    add_column :lycees, :description_etablissement, :string
  end
end
