require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

#Creates at least 3 instances of the apartment class
Apartment.create(address: "6241 Deep Earth Lane", monthly_rent: 2000, sqft: 1000, num_beds: 3, num_baths: 3)
Apartment.create(address: "7631 Seans Terrace", monthly_rent: 3000,  sqft: 2000, num_beds: 4, num_baths: 4)
Apartment.create(address: "8751 Manahan Drive", monthly_rent: 800,  sqft: 1350, num_beds: 3, num_baths: 2)
# I can't remember if each instances is supposed to be followed by commas in text editors

#Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
Tenants.create(name: "Nick Olds", age: 20, gender: "Male", apartment_id: 0)
#if you want to can do nick = Tenants.create(name: "Nick Olds", age: 20, gender: "Male") and then nick.Apartment.all[0]
Tenants.create(name: "Dennis Truong", age: 26, gender: "Male", apartment_id: 1)
Tenants.create(name: "Lynn Truong", age: 30, gender: "Female", apartment_id: 2)
Tenants.create(name: "Edeny Tran", age: 22, gender: "Female", apartment_id: 0)
Tenants.create(name: "Hosanna Tran", age: 23, gender: "Male", apartment_id: 0)
Tenants.create(name: "Keya Zarei", age: 25, gender: "Male", apartment_id: 1)
Tenants.create(name: "Nathan Patel", age: 23, gender: "Male", apartment_id: 1)
Tenants.create(name: "Chaq Daniel", age: 23, gender: "Male", apartment_id: 1)
Tenants.create(name: "John Mendoza", age: 20, gender: "Male", apartment_id: 1)

# queries for all instances of the Tenant class and stores it in a variable of your choice
every_tenants = Tenant.all

# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
Apartment.all[0]

# Updates attributes using attribute helper methods for one of the objects you've created
dennis = Tenant.all[1]
dennis.age = 25

#Saves an object that you updated using attribute helpers to the Database
dennis.save 
#or
dennis_apartment.save

#Updates an object using the update methods
dennis = Tenants.create(name: "Dennis Truong", age: 26, gender: "Male", apartment_id: 1)
dennis.update(name: "Dennis Tuan Truong")
#I'm not sure if i could do this if I wanted to change the Apartment class
dennis_apartment = Apartment.find_by[0]
dennis_apartment.update(monthly_rent: 1300)

# Deletes one of the objects you've created
Tenant.all[8].destroy
Apartment.all[2].destroy
