class Apartment
  attr.accessor :monthly_rent, :sqft, :num_beds, :num_baths
  @monthly_rent
  @sqft
  @num_beds
  @num_baths
  @renters = []
  def initialize address
    @address = address.to_s
  end
  def add_tenant
    i = 0
    while i < self.num_beds.to_i do
       @renters << ObjectSpace.each_object(tenant).to_a.pop
       i += 1
  end
end
