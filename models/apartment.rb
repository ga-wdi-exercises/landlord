class Apartment
  attr_accessor :address
  attr_accessor :monthly_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters

  def initialize address, monthly_rent, sqft, num_beds, num_baths, renters
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end

  def add_tenant(tenant)
    if 1 + @renters.length <= @num_beds
      @renters << tenant
    end
  end
