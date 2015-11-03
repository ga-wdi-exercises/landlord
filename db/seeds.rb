require "bundler/setup"

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

Apartment.destroy_all
Tenant.destroy_all

# Creates at least 3 instances of the apartment class
fake = Apartment.create(address: "456 Fake Street", monthly_rent: 1200, sqft: 120, num_beds: 10, num_baths: 1)

Apartment.create([
  {
    address: "444 Sesame Street",
    monthly_rent: 1400,
    sqft: 20000,
    num_beds: 3,
    num_baths: 5
  },
  {
    address: "1600 Pennsylvania Ave",
    monthly_rent: 25000,
    sqft: 20000,
    num_beds: 10,
    num_baths: 10
  }])

# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
fake.tenants.create([
  {name: "Remilia Scarlet", age: 500, gender: "Female"},
  {name: "Sean Plott", age: 28, gender: "Male"},
  {name: "James Bond", age: 40, gender: "Male"},
  {name: "Frank Fields", age: 26, gender: "Male"},
  {name: "Nick Allen", age: 28, gender: "Male"}
])

Tenant.create(name: "Marisa Kirisame", age: 16, gender: "Female")
Tenant.create(name: "Reimu Hakurei", age: 16, gender: "Female")
Tenant.create(name: "Soren Kierkegaard", age: 300, gender: "Male")
Tenant.create(name: "Plato", age: 1000, gender: "Male")

# queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all

# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
fake_tenants = Apartment.all.find_by(address: "456 Fake Street").tenants

# Updates attributes using attribute helper methods for one of the objects you've created
shrine = Apartment.create(address: "Hakurei Shrine", monthly_rent: 0, sqft: 20000, num_beds: 5, num_baths: 2)
shrine.update(monthly_rent: 10000)

# Saves an object that you updated using attribute helpers to the Database
shrine.save

# Updates an object using the update methods
Tenant.find_by(name: "Sean Plott").update(name: "Day[9]", age: "29")

# Deletes one of the objects you've created
Tenant.find_by(name: "Plato").destroy

binding.pry
