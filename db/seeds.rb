require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

Apartment.destroy_all
Tenant.destroy_all

adam = Tenant.create(name: "Adam", age: 25, gender: "male")
steve = Tenant.create(name: "Steve", age: 27, gender: "male")
joe = Tenant.create(name: "Joe", age: 25, gender: "male")
amy = Tenant.create(name: "Amy", age: 45, gender: "female")
john = Tenant.create(name: "John", age: 48, gender: "male")

unit_1 = Apartment.create(address: "132 Fifth St", monthly_rent: 1300, sqft: 800, num_beds: 2, num_baths: 1)
unit_1.add_tenant adam
unit_1.add_tenant steve

unit_2 = Apartment.create(address: "138 Fifth St", monthly_rent: 1200, sqft: 750, num_beds: 2, num_baths: 1)
unit_2.add_tenant joe

unit_3 = Apartment.create(address: "200 2nd Ave", monthly_rent: 2400, sqft: 1200, num_beds: 4, num_baths: 2)
unit_3.tenants.create(name: "Anne", age: 35, gender: "female")
unit_3.tenants.create(name: "Ben", age: 37, gender: "male")
unit_3.tenants.create(name: "Alice", age: 5, gender: "female")

unit_4 = Apartment.create(address: "210 2nd Ave", monthly_rent: 2000, sqft: 900, num_beds: 2, num_baths: 2)
unit_4.add_tenant amy
unit_4.add_tenant john

# queries
# queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all
# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
assigned_tenants = Tenant.where.not(apartment_id: nil)
# Updates attributes using attribute helper methods for one of the objects you've created
# Saves an object that you updated using attribute helpers to the Database
unit_1 = Apartment.find_by(address: "132 Fifth St")
unit_1.update(monthly_rent: 1400)
unit_1.save
# Updates an object using the update methods
alice = Tenant.find_by(name: "Alice")
alice.age = 7
alice.save
# Deletes one of the objects you've created
joe = Tenant.find_by(name: "Joe")
joe.destroy
