# class Apartment
#   attr_accessor :address, :monthly_rent, :sqft, :num_beds, :num_baths, :renders
#   def initialize(address, monthly_rent, sqft, num_beds, num_baths, renders)
#     @address = address
#     @monthly_rent = monthly_rent
#     @sqft = sqft
#     @num_beds = num_beds
#     @num_baths = num_baths
#     @renders = renders
#     @tenants = []
#   end
#   def add_tenant
#     if !(tenants.length > num_beds)
#       @tenants << tenant
#     end
#   end
# end

class Apartment < ActiveRecord::Base
  has_many :tenants # 'one to many', use 's'
end
