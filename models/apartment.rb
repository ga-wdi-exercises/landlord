# address (a single string including floor and unit numbers if applicable)
# monthy_rent
# sqft
# num_beds
# num_baths
# renters (the tenant or tenants living in the apartment)

class Apartment
  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end
  # Define an instance method add_tenant on the apartment class that allows you to add tenants to an existing apartment. Do not add the tenant to the apartment if the number of tenants would exceed the number of beds
  def add_tenant(tenant)
    @renters << tenant if @renters.length < @num_beds
  end

end
