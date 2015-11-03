
class Apartment < ActiveRecord::Base
	has_many :tenants
end

# require "pry"

# class Apartment

# 	def initialize (address, monthly_rent, sqft, num_beds, num_baths, tenants)
# 		@address = address
# 		@monthly_rent = monthly_rent
# 		@sqft = sqft
# 		@num_beds = num_beds
# 		@num_baths = num_baths
# 		@tenants = []
# 	end
# 	def address
# 		@address
# 	end
# 	def monthly_rent
# 		@monthly_rent
# 	end
# 	def sqft
# 		@sqft
# 	end
# 	def num_beds
# 		@num_beds
# 	end
# 	def num_baths
# 		@num_baths
# 	end
# 	def tenants
# 		@tenants
# 	end
# 	def add_tenant(tenant)
# 		if (tenants.length < num_beds)
# 			tenants << tenant
# 		else
# 			puts "Application REJECTED"
# 		end
# 	end

# end

# home = Apartment.new("1010 Euclid St", 3000, 1000, 5, 3, 4)

# binding.pry