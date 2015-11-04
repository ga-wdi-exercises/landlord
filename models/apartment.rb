require 'pry'

class Apartment < ActiveRecord::Base
  has_many :tenants

#   def initialize address, monthly_rent, sqft,num_beds,num_baths
#     @address = address
#     @monthly_rent = monthly_rent
#     @sqft = sqft
#     @num_beds = num_beds
#     @num_baths = num_baths
#     @renters = []
#   end
#
# def add_tenant renter
#   if @renters.length < @num_beds
#     @renters << renter
#   else
#     puts "Not enough room"
#   end
# end

end

# apt = Apartment.new(121,4000,3500,3,2)
#
# binding.pry
#
# puts "program complete"
#
# # test
