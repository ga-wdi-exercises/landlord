class Apartment
  attr_reader   :address
  attr_accessor :monthly_rent
  attr_reader   :sqft
  attr_reader   :num_beds
  attr_reader   :num_baths
  attr_accessor :renters

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters
  end

  def add_tenant=(renter)
    if num_beds < renters.length
      renters + "and " + renter
    else
      puts "the apartment is at max capacity, sorry!"
    end
  end

end
