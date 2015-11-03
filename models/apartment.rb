class Apartment
  attr_accessor :addres, :monthy_rent, :sqft, :num_beds, :renters
    def initialize (address, monthy_rent, sqft, num_beds, num_baths, renters)
      @address = address
      @monthy_rent = monthy_rent
      @sqft = sqft
      @num_beds = num_beds
      @renters = renters
    end  
  end
end
