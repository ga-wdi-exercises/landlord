require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg"
require "active_record"
require "pry"

require_relative "db/connection.rb"
require_relative "../models/tenant"
require_relative "../models/apartment"

Apartment.destroy_all
Tenant.destroy_all

apartment_1 = Apartment.create(address: "703 Birch Bay Circle", monthly_rent: 500, sqft: 2500, num_beds: 3, num_baths: 1)
apartment_2 = Apartment.create(address: "103 Huntley Meadows Lane", monthly_rent: 900, sqft: 2500, num_beds: 4, num_baths: 2)
apartment_3 = Apartment.create(address: "105 Huntley Meadows Lane", monthly_rent: 1500, sqft: 3750, num_beds: 2, num_baths: 2)

apartment_1.tenants.create(name: "Ranju Sharma", age: 30, gender: "female")
apartment_1.tenants.create(name: "Chris Sharma", age: 77, gender: "male")
apartment_2.tenants.create(name: "Karen", age: 44, gender: "female")
apartment_2.tenants.create(name: "Steve Job", age: 44, gender: "male")
apartment_3.tenants.create(name: "Roshana Devkota", age: 55, gender: "female")
apartment_3.tenants.create(name: "Sharma Parashu", age: 65, gender: "female")
apartment_3.tenants.create(name: "Roshan Pokharel", age: 77, gender: "male")

# query for all objects of the Tenant class, store it in a variable
tenants_all = Tenant.all

# query for all instances of the Tenant class that belong to the first Apartment you created
tenants_apartment_1 = Tenant.where(address: "703 Birch Bay Circle")

# update any one of your objects you've created using attribute helper methods
apartment_1 = Apartment.find_by(address: "703 Birch Bay Circle")
apartment_1.monthly_rent = 2500

# save that object you just updated to the database
apartment_1.save

# update an object using the update method
apartment_1.update(monthly_rent: 2800)

# delete an object
apartment_1.destroy
