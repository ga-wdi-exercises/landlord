require 'bundler/setup'

require 'pg'
require 'active_record'
require 'pry'

require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

# Include seed data here

# Creates at least 3 instances of the apartment class
privot = Apartment.create(address: "4 Privot Dr.", monthly_rent: 3000, sqft: 2400, num_beds: 4, num_baths: 2)
spinners = Apartment.create(address: "1 Spinner's Lane", monthly_rent: 2000, sqft: 1000, num_beds: 2, num_baths: 1)
hogwarts = Apartment.create(address: "Hogwarts", monthly_rent: 4500, sqft: 4000, num_beds: 6, num_baths: 6)
diagon = Apartment.create(address: "15 Diagon Ally", monthly_rent: 3200, sqft: 1400, num_beds: 2, num_baths: 2)
godric = Apartment.create(address: "12 Godric's Hollow", monthly_rent: 3600, sqft: 3100, num_beds: 3, num_baths: 3)

# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
Tenant.create(name: "Petunia Dursley", age: 45, gender: "female", apartment: privot)
Tenant.create(name: "Vernon Dursley", age: 49 , gender: "male", apartment: privot)
Tenant.create(name: "Dudley Dursley", age: 18, gender: "male", apartment: privot)
Tenant.create(name: "Severus Snape", age: 41, gender: "male", apartment: spinners)
Tenant.create(name: "Elaine Prince", age: 68, gender: "female", apartment: spinners)
Tenant.create(name: "Albus Dumbledore", age: 108, gender: "male", apartment: hogwarts)
Tenant.create(name: "Hermione Granger", age: 18, gender: "female", apartment: diagon)
Tenant.create(name: "Ron Weasley", age: 17, gender: "male", apartment: diagon)
Tenant.create(name: "James Potter", age: 41 , gender: "male", apartment: godric)
Tenant.create(name: "Lily Evans", age: 42, gender: "female", apartment: godric)
Tenant.create(name: "Harry Potter", age: 17, gender: "male", apartment: godric)
#
# # queries for all instances of the Tenant class and stores it in a variable of your choice
# tenants = Tenant.all
#
# # queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
# godric_tenants = godric.tenants
#
# # Updates attributes using attribute helper methods for one of the objects you've created
# diagon.monthly_rent = 3200 + (3200 * 0.05)
# # Saves an object that you updated using attribute helpers to the Database
# diagon.save
# # Updates an object using the update methods
# Tenant.last.update(age: 18)
# # Deletes one of the objects you've created
# elaine = tenants.find_by(name: "Elaine Prince")
# elaine.destroy
#
# binding.pry
