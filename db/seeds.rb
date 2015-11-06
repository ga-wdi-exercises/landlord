require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection"

# destroys existing data in database
Apartment.destroy_all
Tenant.destroy_all

# 3 instances of Apartment class
bungalow = Apartment.create(address: "123 Main St.", monthly_rent: 4000, sqft: 1000, num_beds: 3, num_baths: 1.5)
loft = Apartment.create(address: "5 Elm St.", monthly_rent: 3000, sqft: 600, num_beds: 1, num_baths: 1)
ranch = Apartment.create(address: "2 Maple Ct.", monthly_rent: 4500, sqft: 1800, num_beds: 4, num_baths: 3.5)
# 9 instances of Tenant class (5 in apt)
gene = Tenant.create(name: "Gene Simmons", age: 62, gender: "M")
paul = Tenant.create(name: "Paul Stanley", age: 61, gender: "M")
ace = Tenant.create(name: "Ace Frehley", age: 64, gender: "M")
peter = Tenant.create(name: "Peter Criss", age: 59, gender: "M")
#tenants living in apartments
Tenant.create(name: "Mick Jagger", age: 70, gender: "M", apartment: bungalow)
Tenant.create(name: "Keith Richards", age: 70, gender: "M", apartment: bungalow)
Tenant.create(name: "Mick Taylor", age: 67, gender: "M", apartment: loft)
Tenant.create(name: "Bill Wyman", age: 71, gender: "M", apartment: ranch)
Tenant.create(name: "Charlie Watts", age: 70, gender: "M", apartment: ranch)
# queries for all instances of the Tenant class and stores it in a variable of your choice
tenants = Tenant.all
# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
bungalow_tenants = bungalow.tenants
# Updates attributes using attribute helper methods for one of the objects you've created
gene.apartment = loft
# Saves an object that you updated using attribute helpers to the Database
gene.save
# Updates an object using the update methods

# Deletes one of the objects you've created
peter.destroy

binding.pry
