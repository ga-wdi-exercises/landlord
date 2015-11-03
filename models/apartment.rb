class Apartment
  attr_accessor :address
  attr_accessor :monthly_rent
  attr_accessor :sqft
  attr_accessor :num_beds
  attr_accessor :num_baths
  attr_accessor :renters

  def initialize(address, monthly_rent, sqft, num_beds, num_baths, renter)
    @address = address
    @monthlyrent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renter
  end

  def add_tenant
    if num_beds < renters.length
      renters + "and" + renter
    else
      puts "Apartment full"
  end
end

end
albemarle = Apartment.new ('4125 Albemarle St NW Washington DC 20016', 1000, 1200, 5, 3, 'Bobby')
puts albemarle.inspect
