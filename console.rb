require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"

# CLI Interface commands (Step 4)
# 1. Apartment.all.each do |ID, address, monthly_rent|
#       puts apartment.apartment_id
#       puts apartment.address
#       puts apartment.monthly_rent
#     end
# 2. Tenant.all.each do |name, id|
#       puts tenant.name
#       puts tenant.id
#     end
# 3. Apartment.all.each do |apartment|
#       puts #{apartment.address} #{Tenant.find_by(apartment_id: apartment.id) ? Tenant.find_by(apartment_id: apartment.id).name
#     end
