require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "connection.rb"


Apartment.destroy_all
Tenant.destroy_all
# destroys existing data in database

# Creates at least 3 instances of the apartment class
cambridge = Apartment.create(address: '2805 Arlington Blvd', monthly_rent: 1550, sqft: 1000, num_beds: 1, num_baths: 1)
meridian = Apartment.create(address: '1401 N Taft St', monthly_rent: 1750, sqft: 990, num_beds: 1, num_baths: 1)
mountpleasant = Apartment.create(address: '1824 Irving Street NW', monthly_rent: 2500, sqft: 1800, num_beds: 3, num_baths: 1)

# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
cambridge.tenants.create(name: "Kristin Wisoky", age: 24, gender: "Female")
cambridge.tenants.create(name: "Hilbert Effertz", age: 31, gender: "Male")
meridian.tenants.create(name: "Dangelo Bogisich", age: 61, gender: "Female")
meridian.tenants.create(name: "Benton Abernathy", age: 56, gender: "Female")
mountpleasant.tenants.create(name: "Merritt Durgan", age: 35, gender: "Female")
mountpleasant.tenants.create(name: "Enola Sauer V", age: 32, gender: "Female")
mountpleasant.tenants.create(name: "Ethan Sauer", age: 2, gender: "Male")
aurelia = Tenant.create(name: "Aurelia Harvey", age: 36, gender: "Female")
Tenant.create(name: "Daniel Fitzgerald", age: 48, gender: "Male")
Tenant.create(name: "Heather Fitzgerald", age: 23, gender: "Female")

# queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all

# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
homed = Tenant.where.not(apartment_id: nil)

# Updates attributes using attribute helper methods for one of the objects you've created
mountpleasant.monthly_rent = 2750

# Saves an object that you updated using attribute helpers to the Database
mountpleasant.save

# Updates an object using the update methods
meridian.update(sqft: 975)

# Deletes one of the objects you've created
aurelia.destroy
