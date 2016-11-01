class Apartment
  attr_accessor :id, :address, :monthly_rent, :sqft, :num_beds, :num_baths
  def initialize(id, address, monthly_rent, sqft, num_beds, num_baths)
    @id = id,
    @address = address,
    @monthly_rent = monthly_rent,
    @sqft = sqft,
    @num_beds = num_beds,
    @num_baths = num_baths
  end

  def  
