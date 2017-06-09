class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :print_date, :print_dates, :print_time
  	
  def print_dates(dates)
  	new_dates = []
  	dates.each do |date|
  		new_dates = print_date(date)
  	end
  end

  def print_date(date)
  	date.strftime("%m/%d/%Y")
  end

  def print_time(date)
  	date.strftime("%r")
  end
end
