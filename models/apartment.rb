class Apartment
  attr_accessor :address, :monthly_rent, :sqft, :num_beds :num_baths
  def initialize (address, monthly_rent, sqft, num_beds, num_baths)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def add_tenant
    # get new tenant object
    # add new tenant into apartment's existing tenants
    # do not add tenants if # of tenants > number of beds
    if @renter.length < @num_baths
      @renters << @@tenant
    end
  end

end #ends Apartment class
