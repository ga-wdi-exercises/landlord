require 'pry'
class Apartment
    attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths
    def initialize (address, monthly_rent, sqft, num_beds, num_baths)
        @address = address
        @monthly_rent = monthly_rent
        @sqft = sqft
        @num_beds = num_beds
        @num_baths = num_baths
        @renters = []
    end

    def renters
      @renters
    end

    def add_tenant (renter)
        if @renters.length < @num_beds then
            @renters << renter
        end
    end
end

binding.pry

puts "end"
