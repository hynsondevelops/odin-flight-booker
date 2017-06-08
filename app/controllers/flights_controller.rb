class FlightsController < ApplicationController
	def index
		@flights = Flight.all
		if (params != nil)
			@searched_flights = Flight.where(starting_airport_id: params[:starting_airport_id])
		else
			@searched_flights = []
		end
	end
end
