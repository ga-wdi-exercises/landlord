require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection"


Apartment.destroy_all
Tenant.destroy_all
# destroys existing data in database

# - Creates at least 3 instances of the apartment class
langdon = Apartment.create(address: "250 Langdon St.", monthly_rent: 500, sqft: 1200, num_beds: 3, num_baths: 2)
university = Apartment.create(address: "200 University St.", monthly_rent: 400, sqft: 1000, num_beds: 3, num_baths: 2)
park = Apartment.create(address: "200 Park St.", monthly_rent: 400, sqft: 1000, num_beds: 4, num_baths: 1)

# - Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
langdon.Tenants.create(name: "Annie", age: 22, gender: "female")
langdon.Tenants.create(name: "Katie", age: 22, gender: "female")
langdon.Tenants.create(name: "Gene", age: 22, gender: "female")
langdon.Tenants.create(name: "lisa", age: 22, gender: "female")
langdon.Tenants.create(name: "Stefie", age: 22, gender: "female")
university.Tenants.create(name: "Ger", age: 22, gender: "female")
park.Tenants.create(name: "Annie", age: 22, gender: "female")
park.Tenants.create(name: "Katie", age: 22, gender: "female")
park.Tenants.create(name: "Gerababy", age: 22, gender: "female")

# - queries for all instances of the Tenant class and stores it in a variable of your choice
tenant = Tenant.where

# - queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
landgon_tenants = langdon.Tenant.where

# - Updates attributes using attribute helper methods for one of the objects you've created
lisa = Tenant.find_by(name: "lisa")
lisa.age = 24

# - Saves an object that you updated using attribute helpers to the Database
lisa.save

# - Updates an object using the update methods
lisa.update(age: 25)

# - Deletes one of the objects you've created
geralynne = Tenant.find_by(name: "Gerababy")
geralynne.destroy
