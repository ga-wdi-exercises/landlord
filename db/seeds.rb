require 'active_record'
require 'pg'

require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "123 K Street", monthly_rent: 1200, sqft: 400, num_beds: 2, num_baths: 1)
Apartment.create(address: "124 K Street", monthly_rent: 2300, sqft: 500, num_beds: 3, num_baths: 2)
Apartment.create(address: "125 K Street", monthly_rent: 2400, sqft: 600, num_beds: 3, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Professor Horse", age: 27, gender: "Male", apartment_id: 2)
Tenant.create(name: "George Bush", age: 90, gender: "Male", apartment_id: 2)
Tenant.create(name: "Blake Bortles", age: 35, gender: "Male", apartment_id: 2)
Tenant.create(name: "Dwayne Johnson", age: 44, gender: "Male", apartment_id: 2)
Tenant.create(name: "Jerry", age: 28, gender: "Male", apartment_id: 3)
Tenant.create(name: "Tiffany", age: 29, gender: "Female", apartment_id: 3)
Tenant.create(name: "Lila", age: 30, gender: "Female", apartment_id: 3)
Tenant.create(name: "Stephanie", age: 35, gender: "Female", apartment_id: 3)
