require 'pry'

class Apartment
  def initialize address, monthly_rent, sqft, num_beds, num_baths
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_renter renter
    if @renters.length < @num_beds
      @renters << renter
    else
      puts "Not enough beds"
    end
  end

  def get_renter
    @renters
  end

end

red_brick = Apartment.new("4001 9th St N", 900, 1800, 3, 2)

binding.pry

puts "I'm hungry"
