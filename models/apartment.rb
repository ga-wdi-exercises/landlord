require 'pry'

class Apartments
 attr_accessor :address
 attr_accessor :monthly_rent
 attr_accessor :sqft
 attr_accessor :num_beds
 attr_accessor :num_baths
 attr_accessor :renter

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthy_rent = monthy_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end
end

def add_tenant (person)
  if @renters.length < @num_beds
    @renters << person
  end
end
