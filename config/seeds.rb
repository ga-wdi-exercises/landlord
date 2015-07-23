# don't forget to load dependencies!
require 'active_record'
require 'pry'

require_relative '../models/apartment'
require_relative '../models/tenant'
require_relative '../config/db.rb'

Apartment.destroy_all
Tenant.destroy_all
# create at least 3 objects of the apartment class
Apartment.create([
  {address: "1234 1st St", monthly_rent: 800,  sqft: 1100, num_beds: 1, num_baths: 1},
  {address: "2341 2nd St", monthly_rent: 900,  sqft: 1200, num_beds: 2, num_baths: 2},
  {address: "3412 3rd St", monthly_rent: 1000,  sqft: 1300, num_beds: 3, num_baths: 3}
  ])
# create at least 9 objects(at least 5 must be long to an apartment)
Apartment.all[0].tenants.create([
  {name: "sam", age: 24, gender: "f"},
  {name: "tom", age: 26, gender: "m"},
  {name: "jerry", age: 32, gender: "m"}
  ])
Apartment.all[1].tenants.create([
  {name: "megan", age: 52, gender: "f"},
  {name: "mary", age: 44, gender: "f"},
  {name: "shamus", age: 28, gender: "m"}
  ])
Apartment.all[2].tenants.create([
  {name: "eltahir", age: 32, gender: "m"},
  {name: "lindsay", age: 24, gender: "f"},
  {name: "haleigh", age: 37, gender: "f"}
  ])
# query for all objects of the Tenant class, store it in a variable
all_tenants = Tenant.all

# query for all instances of the Tenant class that belong to the first Apartment you created

Apartment.first.tenants
# update any one of your objects you've created using attribute helper methods
first_street_apt = Apartment.first
first_street_apt.monthly_rent = 840

# save that object you just updated to the database
first_street_apt.save

# update an object using the update method
Tenant.last.update(age: 25)

# delete an object
Tenant.all[4].destroy
