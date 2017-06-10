class Flight < ApplicationRecord
	belongs_to :starting_airport, class_name: "Airport"
	belongs_to :finishing_airport, class_name: "Airport"
	has_many :bookings
end
