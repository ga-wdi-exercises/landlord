class Apartment
  attr_reader :address #(a single string including floor and unit numbers if applicable)
  attr_accessor :monthy_rent
  attr_reader :sqft
  attr_reader :num_beds
  attr_reader :num_baths
  attr_accessor :renters # (the tenant or tenants living in the apartment)

  def initialize address, monthy_rent, sqft, num_beds, num_baths
    @address = address
    @monthy_rent = monthy_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = Array.new
  end

  def add_tenant new_tenant

    if renters.count < num_beds
      renters << new_tenant
    else
    puts "Sorry. This apartment is full."
    end #if-else closure

  end #add_tenant closure

end #class closure
