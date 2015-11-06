class Apartment < ActiveRecord::Base
  has_many :tenants
  # attr.accessor :monthly_rent, :sqft, :num_beds, :num_baths
  @renters = []
  def initialize (address, monthly_rent, sqft, num_beds, num_baths )
    @address = address.to_s
    @monthly_rent = monthly_rent.to_i
    @sqft = sqft
    @num_beds = num_beds.to_i
    @num_baths = num_baths.to_i
  end
  def add_tenant
    i = 0
    while i < self.num_beds.to_i do
       @renters << ObjectSpace.each_object(tenant).to_a.pop
       i += 1
     end
  end
end
