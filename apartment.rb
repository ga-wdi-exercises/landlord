class Apartment <Tenant
  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renters;
  def initialize
    @address;
    @monthly_rent;
    @sqft;
    @num_beds;
    @num_baths;
    @renters;
  end

  def add_tenant
    tenant=Tenant.new();
      while (num_beds<= renters.length) do
        renters << tenant;
      end
    # end of defnition add_tenant
  end
# end of class
end
