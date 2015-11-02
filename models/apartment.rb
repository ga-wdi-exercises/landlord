require 'pry'

class Apartment

  attr_reader :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters

  def initialize(address, monthly_rent, sqft, num_beds, num_baths)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_tenant(renter)
    if @renters.length < @num_beds then
      @renters << renter
    end
  end

  # whitehouse = Apartment.new("washington dc", 10000, 550, 20, 8, "john")

end
binding.pry
