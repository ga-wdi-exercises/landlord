class Apartment
  attr_accessor :address, :montly_rent, :sqft, :num_beds, :num_baths, :renters
  def initialize address, monthly_rent, sqft, num_beds, num_baths, renters
    @address = address
    @monthly_rent = montly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end
  def add_tenant new_tenant
    if self.num_beds > self.renters.length
      self.renters << new_tenant
    end
  end
end
