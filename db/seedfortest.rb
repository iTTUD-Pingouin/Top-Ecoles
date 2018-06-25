require 'faker'
require 'csv'

filepath = 'db/fr-en-annuaire-education.csv'
csv_options = {col_sep: ';', headers: :first_row }


puts "Parsing fr-en-annuaire-education csv file ..."

CSV.foreach(filepath, csv_options) do |row|
  puts "Création des écoles ..."
  schoolname = row["Nom_etablissement"].gsub(/(Collège |Lycée |privé )/, "")
  school = School.new(name: schoolname, commune: row["Nom_commune"], statut: row["Statut_public_prive"])
  # school.remote_photo_url = row["photo-batiment"]
  school.save!

  puts "Création des collèges ..."

  if row["Type_etablissement"] == "Collège"
    college = College.create!(
      address: row["Adresse_1"],
      school_id: school.id,
      statut: school.statut,
      uai: row['Identifiant_de_l_etablissement'],
      commune: row['Nom_commune'],
      name: row['Nom_etablissement'],
      cp: row['Code postal'],
      code_commune: row['Code_commune'],
      code_departement: row['Code_departement'],
      telephone: row['Telephone'],
      website: row['Web'],
      students_number: row['Nombre_d_eleves'],
      onisep_view: row['Fiche_onisep']
      )

    # Filières, si présente, paramètre passé à true

      if row['Restauration'] == 1
        college.has_restauration = true
        college.save!
      end

      if row['Hebergement'] == 1
        college.has_hebergement = true
        college.save!
      end

      if row['ULIS'] == 1
        college.has_ulis = true
        college.save!
      end

      if row['Apprentissage'] == 1
        college.has_apprentissage = true
        college.save!
      end

      if row['Segpa'] == 1
        college.has_segpa = true
        college.save!
      end

      if row['Section_arts'] == 1
        college.has_art_section = true
        college.save!
      end

      if row['Section_cinema'] == 1
        college.has_cinema_section = true
        college.save!
      end

      if row['Section_theatre'] == 1
        college.has_theatre_section = true
        college.save!
      end

      if row['Section_sport'] == 1
        college.has_sport_section = true
        college.save!
      end

      if row['Section_internationale'] == 1
        college.has_international_section = true
        college.save!
      end

      if row['Section_europeenne'] == 1
        college.has_european_section = true
        college.save!
      end

      if row['Lycee_Agricole'] == 1
        college.has_agricole_section = true
        college.save!
      end

      if row['Lycee_militaire'] == 1
        college.has_military_section = true
        college.save!
      end

      if row['Lycee_des_metiers'] == 1
        college.has_metiers_section = true
        college.save!
      end

      if row['Post_BAC'] == 1
        college.has_post_bac_sections = true
        college.save!
      end

      if (row['Appartenance_Education_Prioritaire'] != "") && (row['Appartenance_Education_Prioritaire'] != nil)
        college.is_educ_priority_zone = true
        college.save!
      end


    # chiffre = (1..4).to_a.sample
    # activities = ["Cinéma", "Arts plastiques", "Théatre", "Sport"].sample(chiffre)

    # activities.each do |activity|
    #   college.activities << activity
    # end

    # pensionnat = [true, false].sample
    # college.pensionnat = pensionnat
    # college.rating = (1..5).to_a.sample

    college.save!
  elsif row["type d'établissement"] == "Lycée"
    lycee = Lycee.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])
    lycee.rating = (1..5).to_a.sample
    lycee.save!
  end
end
