# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'csv'

filepath = 'db/schools-with-photos.csv'
csv_options = {col_sep: ';', headers: :first_row }


puts "Parsing sampleschools csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  schoolname = row["nom"].gsub(/(Collège |Lycée |privé )/, "")
  school = School.new(name: schoolname, commune: row["commune"], statut: row["statut"])
  school.remote_photo_url = row["photo-batiment"]
  school.save!

  if row["type d'établissement"] == "Collège"
    College.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])
  elsif row["type d'établissement"] == "Lycée"
    Lycee.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])
  end


end

puts "Parsing sampleschools over succesfully ! "

filepath = 'db/sections.csv'

puts "Parsing sections csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  if (row["Niveau"] == "Collège") && (College.find_by(uai: row["U.A.I."][0...8]))
    college = College.find_by(uai: row["U.A.I."][0...8])
    section_size = row["SECTION BI- ET INTERNATIONALE"].size
    college.sections << row["SECTION BI- ET INTERNATIONALE"]
    college.save!
  elsif (row["Niveau"] == "Lycée") && (Lycee.find_by(uai: row["U.A.I."][0...8]))
    lycee = Lycee.find_by(uai: row["U.A.I."][0...8])
    lycee.sections << row["SECTION BI- ET INTERNATIONALE"]
    lycee.save!
  end
end

puts "Parsing sections over succesfully ! "


puts "Creating some filieres"
50.times do
  filiere = Filiere.new(
    name:    ['ES', 'S', 'L', 'STG', 'STMG', 'SMS', 'Hoteliere', 'Agricole'].sample,
    success_rate: Faker::Number.between(80, 89).to_f + Faker::Number.decimal(1, 2).to_f,
    mention_rate: Faker::Number.between(70, 79).to_f  + Faker::Number.decimal(1, 2).to_f ,
    tb_mention_rate: Faker::Number.between(0, 60).to_f  + Faker::Number.decimal(1, 2).to_f ,
    lycee_id: Lycee.all.sample.id,
  )
  filiere.save!
end
puts "Filières added!"


puts "Creating 3 others Collèges"

school = School.create!(name: 'Sacré Coeur', commune: 'Aix-en-Provence', statut: 'Privé sous contrat')
url = "https://www.immojeunepro.com/bundles/boresidence/uploads/documents/570x366/9c0ec579adbcbc91e698c7308e06c9e19d2a7a00-570x366.jpeg"
school.remote_photo_url = url
school.save!
College.create!(address: '33 cours Mirabeau', school_id: school.id, statut: 'Privé sous contrat', commune: 'Aix-en-Provence', sections: ["ESPAGNOLE", "BRITANNIQUE"], activities: ["Arts plastiques", "Musique", "Football", "Tennis"])

school = School.create!(name: 'Sainte-Marie', commune: 'Aix-en-Provence', statut: 'Privé sous contrat')
url = "https://www.saintemarie-caen.fr/wp-content/uploads/2017/02/P_index_3.jpg"
school.remote_photo_url = url
school.save!
College.create!(address: '24 avenue des arts et métiers', school_id: school.id, statut: 'Privé sous contrat', commune: 'Aix-en-Provence', sections: ["ESPAGNOLE", "DANOISE", "ITALIENNE"], activities: ["Théatre", "Musique", "Cinéma", "Arts plastiques"])


school = School.create!(name: 'Emile Zola', commune: 'Aix-en-Provence', statut: 'Public')
url = "http://mikestravelguide.com/wp-content/uploads/2013/03/College-Mignet-3-Cezanne-Walk-Aix-en-Provence-France-800x534.jpg"
school.remote_photo_url = url
school.save!
College.create!(address: '2 rue de Rome', school_id: school.id, statut: 'Public', commune: 'Aix-en-Provence', sections: ["ESPAGNOLE", "DANOISE", "ITALIENNE", "JAPONAISE"], activities: ["Arts plastiques", "Musique", "Football", "Piscine"])

puts "3 others Collèges created"


