class Apartment
  def initialize(address, monthy_rent, sqft, num_beds, num_baths, renters)
    @address = address
    @monthy_rent = monthy_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = []
  end

  def address
    @address
  end

  def monthy_rent
    @monthy_rent
  end

  def sqft
    @sqft
  end

  def num_beds
    @num_beds
  end

  def num_baths
    @num_baths
  end

  def renters
    @renters
  end

  def apartment_info
    puts "Location:#{address}, Rent:#{monthy_rent}, Size:#{sqft}, Bed:#{num_beds}, Bath:#{num_baths}, Current Renters:#{renters}"
  end
end

unit = Apartment.new("14072 Way Way Drive, Apt 8", 1200, "800sqft", "2 bedrooms", 1, "Bob")
unit.apartment_info
