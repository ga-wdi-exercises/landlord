require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'

require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

# binding.pry

# Apartment.destroy_all
# Tenant.destroy_all

# apartments (address, monthly_rent, sqft, num_beds, num_baths)
# tenants (name, age, gender, apartment_id)

# Creates at least 3 instances of the apartment class
apt1 = Apartment.create(address: "1400 Pennsylvania Ave NW", monthly_rent: 50000,
                        sqft: 54900, num_beds: 3, num_baths: 35)
apt2 = Apartment.create(address: "4201 31st St S", monthly_rent: 1500, sqft: 800,
                        num_beds: 1, num_baths: 1)
apt3 = Apartment.create(address: "East Capitol St NE", monthly_rent: 30000,
                        sqft: 20000, num_beds: 10, num_baths: 2)

# Creates at least 9 instances of the Tenant class. At least 5 should belong to
# an apartment
paul = Tenant.create(name: "Paul Ryan", age: 45, gender: "Male", apartment_id: apt3.id)
nancy = Tenant.create(name: "Nancy Pelosi", age: 75, gender: "Grandmother", apartment_id: apt3.id)
don = Tenant.create(name: "Don Beyer", age: 65, gender: "Male", apartment_id: apt3.id)
steve = Tenant.create(name: "Steve Scalise", age: 50, gender: "Male", apartment_id: apt3.id)
steny = Tenant.create(name: "Steny Hoyer", age: 76, gender: "Male", apartment_id: apt3.id)
eleanor = Tenant.create(name: "Eleanor Holmes Norton", age: 78, gender: "Female", apartment_id: apt3.id)
barry = Tenant.create(name: "Barrack Obama", age: 54, gender: "Male", apartment_id: apt1.id)
malia = Tenant.create(name: "Malia", age: 17, gender: "Female", apartment_id: apt1.id)
sasha = Tenant.create(name: "Sasha", age: 15, gender: "Female", apartment_id: apt1.id)

binding.pry

# Queries for all instances of the Tenant class and stores it in a variable of
# your choice
tenants = Tenant.all

# Queries for all instances of the Tenant class that belong to one of the
# Apartments you created and stores it in a variable of your choosing.
apt3_tenants = apt3.tenants

# Updates attributes using attribute helper methods for one of the objects
# you've created
steny.age = steny.age + 1

# Saves an object that you updated using attribute helpers to the Database
steny.save

# Updates an object using the update methods
eleanor.update(age: eleanor.age + 1)
# Deletes one of the objects you've created
malia.delete

# binding.pry
