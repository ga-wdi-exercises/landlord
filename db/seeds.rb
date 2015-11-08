require 'active_record'
require 'bundler/setup'
require 'pry'

require_relative '../db/connection.rb'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all
# create at least 3 objects of the apartment class
first_street_apt  = Apartment.create(address: "1234 1st St", monthly_rent: 800,  sqft: 1100, num_beds: 2, num_baths: 1)
second_street_apt = Apartment.create(address: "2341 2nd St", monthly_rent: 900,  sqft: 1200, num_beds: 3, num_baths: 2)
third_street_apt  = Apartment.create(address: "3412 3rd St", monthly_rent: 1000,  sqft: 1300, num_beds: 4, num_baths: 3)

# create at least 9 objects(at least 5 must be long to an apartment)
first_street_apt.tenants.create([
  {name: "sam", age: 24, gender: "f"},
  {name: "tom", age: 26, gender: "m"},
  {name: "jerry", age: 32, gender: "m"}
  ])
second_street_apt.tenants.create([
  {name: "megan", age: 52, gender: "f"},
  {name: "mary", age: 44, gender: "f"},
  {name: "shamus", age: 28, gender: "m"}
  ])
third_street_apt.tenants.create([
  {name: "eltahir", age: 32, gender: "m"},
  {name: "lindsay", age: 24, gender: "f"},
  {name: "haleigh", age: 37, gender: "f"}
  ])
# query for all objects of the Tenant class, store it in a variable
all_tenants = Tenant.all

# query for all instances of the Tenant class that belong to the first Apartment you created
first_street_apt.tenants

# update any one of your objects you've created using attribute helper methods
first_street_apt.monthly_rent = 840

# save that object you just updated to the database
first_street_apt.save!

# update an object using the update method
Tenant.last.update(age: 25)

# delete an object
Tenant.last.destroy
