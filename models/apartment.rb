class Apartment
  attr_accessor :address
  attr_reader :monthly_rent
  attr_reader :sqft
  attr_reader :num_beds
  attr_reader :num_baths
  attr_accessor :renters

  def initialize(address_string, monthly_rent, sqft, num_beds, num_baths)
    @address = address_string
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_tenant tenant
    if @renters.length >= @num_beds.to_i
      return false
    else @renters.length <= @num_beds.to_i
      self.renters << tenant
    end
  end

end
