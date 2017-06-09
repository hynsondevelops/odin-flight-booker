class FlightsController < ApplicationController
	def index
		#Airports
		init_airports
		#Dates
		@flights = Flight.all
		init_dates
		#search
		search_flights
	end

	def init_airports
		@airports = Airport.all
		@airport_codes = [] 
		@airports.each do |airport| 
			@airport_codes.push(airport.code) 
		end
	end

	def init_dates
		@dates = []
		@flights.each do |flight|
			if (!@dates.include?(print_date(flight.start_date_time)))
				@dates.push(print_date(flight.start_date_time))
			end
		end 
	end

	def search_flights
		if (params[:starting_airport] != nil)
			@searched_flights = []
			@airports.each do |airport|
				if (airport.code == params[:starting_airport])
					@start = airport
				end
				if (airport.code == params[:finishing_airport])
					@finish = airport
				end
			end
			@flights.each do |flight|
				if (flight.starting_airport_id == @start.id && flight.finishing_airport_id == @finish.id && print_date(flight.start_date_time) == params[:start_date_time])
					@searched_flights.push(flight)
				end
			end
		else
			@searched_flights = []
		end
	end
end
