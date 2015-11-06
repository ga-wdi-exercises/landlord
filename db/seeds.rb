require 'bundler/setup'
require 'pry'
require 'active_record'

require_relative 'connection'
# models
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all
# Creates 3 apartment instances in the Apartment class and saves them to the database
meridian = Apartment.create(id: 1, address: "111 First Street", monthly_rent: 1025, sqft: 400, num_beds: 1, num_baths: 1)
cityview = Apartment.create(id: 2, address: "222 U Street", monthly_rent: 950, sqft: 800, num_beds: 2, num_baths: 2)
plaza = Apartment.create(id: 3, address: "333 Orlando Drive", monthly_rent: 1200, sqft: 1000, num_beds: 4, num_baths: 1)

# Creates 9 tenant quarterbacks of the Tenant class and saves them to the database
blake = Tenant.create(id: 1, name: "Blake Bortles", age: 23, gender: "Male", apartment_id: 1)
kirk = Tenant.create(id: 2, name: "Kirk Cousins", age: 23, gender: "Male", apartment_id: 2)
tom = Tenant.create(id: 3, name: "Tom Freaking Brady", age: 45, gender: "Male", apartment_id: 2)
tyrod = Tenant.create(id: 4, name: "Tyrod Taylor", age: 21, gender: "Male", apartment_id: 3)
drew = Tenant.create(id: 5, name: "Drew Breesus", age: 35, gender: "Male", apartment_id: 3)
aaron = Tenant.create(id: 6, name: "Aaron Discount Doublecheck Rodgers", age: 27, gender: "Male")
donovan = Tenant.create(id: 7, name: "Donovan McNabb", age: 40, gender: "Male")
jameis = Tenant.create(id: 8, name: "Famous Jameis", age: 21, gender: "Male")
rex = Tenant.create(id: 9, name: "Sexy Rexy Grossman", age: 36, gender: "Male")

# Queries for all instances of the tenant class and saves them in a variable
all_tenants = Tenant.all

# Queries for all tenants at the meridian
meridian_tenants = Tenant.find_by(apartment_id: 1)

# Update attributes with accessor method and saves for a quarterback's age
blake.age = 24
blake.save!

# Update attributes with .update
blake.update(age: 25)

# Time to retire, Donovan. Philly fans will never appreciate you.
# Not sure if I need this top line but I'll include it.
donovan = Tenant.find_by(name: "Donovan McNabb")
donovan.destroy
