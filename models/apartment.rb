class Apartment
  attr_accessor :renters
  attr_reader :address, :monthly_rent, :sqft, :numb_beds, :num_baths

  def initialize(address)
    @address = apt_address
    @monthly_rent = rent
    @sqft = sqft
    @numb_beds = beds
    @num_baths = baths
    @renters = renters
  end

  def add_tenant
    if renters > 0
      puts "There is already someone in this room."
    else
      Tenant.new  # create new person
      puts "Tenant added."
  end
end
