require "bundler/setup"
require "pg" 
require "active_record"
require "pry" 

require_relative "connection" 
require_relative "../models/apartment" 
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

# Creates at least 3 instances of the apartment class
euclid = Apartment.create(address: "1010 Euclid St NW", monthly_rent: 4000, sqft: 2000, num_beds: 5, num_baths: 2)
n_scott = Apartment.create(address: "1410 North Scott St", monthly_rent: 2000, sqft: 500, num_beds: 1, num_baths: 1)
peabody = Apartment.create(address: "1834 Peabody St", monthly_rent: 4000, sqft: 1800, num_beds: 3, num_baths: 2)

# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
becca = Tenant.create(name: "Rebecca", age: 28, gender: "Female", apartment_id: 1)
carol = Tenant.create(name: "Carol", age: 31, gender: "Female", apartment_id: 1)
alison = Tenant.create(name: "Alison", age: 29, gender: "Female", apartment_id: 1)
lauren = Tenant.create(name: "Lauren", age: 30, gender: "Female", apartment_id: 1)
emelin = Tenant.create(name: "Emelin", age: 30, gender: "Female", apartment_id: 1)
jason = Tenant.create(name: "Jason", age: 28, gender: "Male", apartment_id: 2)
natalie = Tenant.create(name: "Natalie", age: 28, gender: "Female", apartment_id: 3)
shawn = Tenant.create(name: "Shawn", age: 30, gender: "Male", apartment_id: 3)
chloe = Tenant.create(name: "Chloe", age: 4, gender: "Female", apartment_id: 3)

# queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all

# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
tenants_peabody = Tenant.where(apartment_id: 3)

# Updates attributes using attribute helper methods for one of the objects you've created
jason.apartment.monthly_rent = 1800

# Saves an object that you updated using attribute helpers to the Database
jason.apartment.save

# Updates an object using the update methods
natalie.update(age: 29)

# Deletes one of the objects you've created
chloe.destroy

binding.pry

