class PassengerMailer < ApplicationMailer
	default from: 'notfications@example.com'
	
	def welcome_email(passenger)
		@passenger = passenger
		@url = 'http://example.com/login'
		mail(to: @passenger.email, subject: 'Welcome to My Awesome Site')
	end
end
