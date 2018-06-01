# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'csv'

filepath = 'db/sampleschools.csv'
csv_options = {col_sep: ';', headers: :first_row }


puts "Parsing sampleschools csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  schoolname = row["nom"].gsub(/(Collège |Lycée |privé )/, "")
  school = School.new(name: schoolname, commune: row["commune"], statut: row["statut"])
  school.save

  if row["type d'établissement"] == "Collège"
    College.create!(address: row["adresse"], school_id: school.id, uai: row['code UAI'], commune: row['commune'])
  elsif row["type d'établissement"] == "Lycée"
    Lycee.create!(address: row["adresse"], school_id: school.id, uai: row['code UAI'], commune: row['commune'])
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
    college.save
  elsif (row["Niveau"] == "Lycée") && (Lycee.find_by(uai: row["U.A.I."][0...8]))
    lycee = Lycee.find_by(uai: row["U.A.I."][0...8])
    lycee.sections << row["SECTION BI- ET INTERNATIONALE"]
    lycee.save
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
    lycee_id: rand(1..13),
  )
  filiere.save!
end


