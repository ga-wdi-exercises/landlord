require 'pry'

class Apartment
  def  initialize(address, monthly_rent, sqft, num_beds, num_baths)
    @address = address

    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_tenant(tenant)
    if @renters.count < @num_beds
     @renters << tenant
    else
      puts 'too many renters'
    end
  end
end
binding.pry
puts "pry works"
