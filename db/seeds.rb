# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'csv'

filepath = 'db/db-antoine.csv'
csv_options = {col_sep: ';', headers: :first_row }


puts "Parsing sampleschools csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  schoolname = row["nom"].gsub(/(Collège |Lycée |privé )/, "")
  school = School.new(name: schoolname, commune: row["commune"], statut: row["statut"])
  school.remote_photo_url = row["photo-batiment"]
  school.save!

  if row["type d'établissement"] == "Collège"
    college = College.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])


    chiffre = (1..4).to_a.sample
    activities = ["Cinéma", "Arts plastiques", "Théatre", "Sport"].sample(chiffre)

    activities.each do |activity|
      college.activities << activity
    end

    pensionnat = [true, false].sample
    college.pensionnat = pensionnat
    college.rating = (1..5).to_a.sample

    college.save!
  elsif row["type d'établissement"] == "Lycée"
    lycee = Lycee.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])
    lycee.rating = (1..5).to_a.sample
    lycee.save!
  end
end






filepath = 'db/schools-with-photos.csv'
csv_options = {col_sep: ';', headers: :first_row }


puts "Parsing sampleschools csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  schoolname = row["nom"].gsub(/(Collège |Lycée |privé )/, "")
  school = School.new(name: schoolname, commune: row["commune"], statut: row["statut"])
  school.remote_photo_url = row["photo-batiment"]
  school.rating = (1..5).to_a.sample
  school.save!

  if row["type d'établissement"] == "Collège"
    college = College.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])


    chiffre = (1..4).to_a.sample
    activities = ["Cinéma", "Arts plastiques", "Théatre", "Sport"].sample(chiffre)

    activities.each do |activity|
      college.activities << activity
    end

    pensionnat = [true, false].sample
    college.pensionnat = pensionnat

    college.rating = (1..5).to_a.sample

    college.save!
  elsif row["type d'établissement"] == "Lycée"
    lycee = Lycee.create!(address: row["adresse"], school_id: school.id, statut: school.statut, uai: row['code UAI'], commune: row['commune'])
    lycee.save!
  end
end





puts "Parsing db-matzi over succesfully ! "

filepath = 'db/db-matzi.csv'

puts "Parsing sections csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  if (row["Niveau"] == "Collège") && (College.find_by(uai: row["U.A.I."][0...8]))
    college = College.find_by(uai: row["U.A.I."][0...8])
    section_size = row["SECTION BI- ET INTERNATIONALE"].size
    college.sections << row["SECTION BI- ET INTERNATIONALE"]
    college.save!
    puts "Filière #{row["SECTION BI- ET INTERNATIONALE"]} du college #{college.school.name} créé"
  elsif (row["Niveau"] == "Lycée") && (Lycee.find_by(uai: row["U.A.I."][0...8]))
    lycee = Lycee.find_by(uai: row["U.A.I."][0...8])
    lycee.sections << row["SECTION BI- ET INTERNATIONALE"]
    lycee.save!
    puts "Filière #{row["SECTION BI- ET INTERNATIONALE"]} du lycee #{lycee.school.name} créé"
  end
end

puts "Parsing db-matzi over succesfully ! "



filepath = 'db/sampleschools.csv'

puts "Parsing sections csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  if (row["Niveau"] == "Collège") && (College.find_by(uai: row["U.A.I."][0...8]))
    college = College.find_by(uai: row["U.A.I."][0...8])
    section_size = row["SECTION BI- ET INTERNATIONALE"].size
    college.sections << row["SECTION BI- ET INTERNATIONALE"]
    college.save!
    puts "Filière #{row["SECTION BI- ET INTERNATIONALE"]} du college #{college.school.name} créé"
  elsif (row["Niveau"] == "Lycée") && (Lycee.find_by(uai: row["U.A.I."][0...8]))
    lycee = Lycee.find_by(uai: row["U.A.I."][0...8])
    lycee.sections << row["SECTION BI- ET INTERNATIONALE"]
    lycee.save!
    puts "Filière #{row["SECTION BI- ET INTERNATIONALE"]} du lycee #{lycee.school.name} créé"
  end
end



puts "Parsing sections over succesfully ! "


puts "Creating some filieres"
140.times do
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



