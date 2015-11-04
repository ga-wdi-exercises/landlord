require 'pry'

class Apartment
  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters
  def initialize (address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
    @renters << renters
  end
  def add_tenant (tenant)
    if @renters.length < @num_beds then
      @renters << tenant
    end
    # do not add if num of tenants > number of beds
  end
end

binding.pry
puts "apartment record complete"
