# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/tenant'
require_relative 'models/apartment'

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

# the_bat_cave = Apartment.create(address: "123 Main St", monthly_rent: 2000, sqft: 600, num_beds: 2, num_baths: 1)
# me = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment_id: the_bat_cave)
#
# binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
