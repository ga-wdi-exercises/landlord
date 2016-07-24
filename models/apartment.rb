require "pry"

class Apartment < ActiveRecord::Base
  has_many :tenants
end

# class Apartment
#
#   attr_accessor :id, :address, :monthly_rent, :square_feet
#   @@ruby_apartments = []
#
#   def initialize (id, address, monthly_rent, square_feet)
#     @id = id
#     @address = address
#     @monthly_rent = monthly_rent
#     @square_feet = square_feet
#     @@ruby_apartments.push(self)
#   end
#
#   def Apartment.list_addresses
#     @@ruby_apartments.each do |apartment|
#       puts "#{apartment.address}"
#     end
#   end
#
# end

binding.pry
