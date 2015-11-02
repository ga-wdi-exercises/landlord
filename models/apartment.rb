class Apartment
  attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths
  attr_reader :renters # my inclination is to not make this settable b/c we have an explicit set function

  def initialize address, monthly_rent, sqft, num_beds, num_baths, renters
    @address = address
    @monthly_rent = monthly_rent
    @sqft = sqft
    @num_beds = num_beds
    @num_baths = num_baths
    @renters = renters # array []
  end

  def add_tenant tenant
    renters << tenant if renters.length < num_beds
    # should we reference renters and num_beds without @
    # my inclination is to not
  end

end
