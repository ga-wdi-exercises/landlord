class Apartment < ActiveRecord::Base
  has_many :tenants
  def add_tenant=(tenant)
    if num_beds < tenant.length
      tenants + "and " + tenant
    else
      puts "the apartment is at max capacity, sorry!"
    end
  end

end
