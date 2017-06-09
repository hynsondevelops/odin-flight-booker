# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Airports
Airport.create!(code: "NYC")
Airport.create!(code: "LAX")
Airport.create!(code: "ATL")
Airport.create!(code: "JFK")
Airport.create!(code: "PEK")
Airport.create!(code: "DXB")
Airport.create!(code: "ORD")
Airport.create!(code: "HND")
Airport.create!(code: "LHR")
Airport.create!(code: "HKG")
Airport.create!(code: "CDG")
Airport.create!(code: "DFW")

#Flights
all_ports = Airport.all
for i in (0..3)
	for j in (0..3)
		Flight.create!(start_date_time: DateTime.now + i * j, duration_seconds: 1, starting_airport_id: i + 1, finishing_airport_id: j + 1)
		Flight.create!(start_date_time: DateTime.now + i * j + 0.1, duration_seconds: 1, starting_airport_id: i + 1, finishing_airport_id: j + 1)
	end
end