# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'


filepath = 'db/sampleschools.csv'
csv_options = {col_sep: ';', headers: :first_row }



puts "Parsing csv file ..."
CSV.foreach(filepath, csv_options) do |row|
  School.create!(name: row["nom"], commune: row["commune"], statut: row["statut"])
end

puts "Parsing over succesfully ! "
