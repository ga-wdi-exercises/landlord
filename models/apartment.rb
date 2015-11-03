class Apartment < ActiveRecord::Base
has_many :tenants
end


class apartment
  def initialize(
    address,
    monthly_rent,
    sqft,
    num_beds,
    num_baths,
    renter
    )
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renter []
  end

#create add tenant setter
  def add_tenant
    if @@tenant < @num_beds
        @renter << tenant
      else @tenants = tenants
    end
  end

end

#ActiveRecord
