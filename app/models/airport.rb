class Airport < ApplicationRecord
	has_many :departing_flights, :foreign_key => :starting_airport_id, class_name: "Flight"
	has_many :arriving_flights, :foreign_key => :leaving_airport_id, class_name: "Flight"
end
