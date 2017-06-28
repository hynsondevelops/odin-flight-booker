class BookingsController < ApplicationController
	def new
		@flight = Flight.find(params[:chosen_flight_id])
		@booking = @flight.bookings.build
		for i in 0...(params[:passengers].to_i)
			@message = "#{i}"
			@booking.passengers.build
		end
	end

	def create 
		@booking = Booking.create(flight_id: params[:booking][:flight_id])
		params[:booking][:passengers_attributes].each do |i|
			@booking.passengers.create(name: params[:booking][:passengers_attributes][i][:name], email: params[:booking][:passengers_attributes][i][:email])
			PassengerMailer.welcome_email(@booking.passengers.find_by(name: params[:booking][:passengers_attributes][i][:name])).deliver_now
		end
		redirect_to booking_path(@booking.id)
	end

	def show
		@booking = Booking.find(params[:id])
		@flight = @booking.flight
	end

	private

		def booking_params
	      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
	    end
end
