require 'pry'

class Apartment

  def initialize address, monthly_rent, sqft, num_beds, num_baths
    @adress = address.to_s
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_tenant tenant
    if @renters.length < @num_beds
    @renters << tenant
    else
      puts "Not enough room"
    end
  end

end

binding.pry

puts "testing"
