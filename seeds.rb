require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment" # require the apartment class definition that we defined in the models/apartment.rb file
require_relative "models/tenant" # require the tenant class definition that we defined in the models/tenant.rb file

Apartment.destroy_all
Tenant.destroy_all

# ○ Creates at least 3 instances of the apartment class
ap1 = Apartment.create(address: "917 7th St", monthly_rent: 490, sqft: 450, num_beds: 4, num_baths: 1.5)
ap2 = Apartment.create(address: "1003 Evarts St", monthly_rent: 900, sqft: 650, num_beds: 5, num_baths: 4.5)
ap3 = Apartment.create(address: "1321 Harvard St", monthly_rent: 1200, sqft: 600, num_beds: 6, num_baths: 3)

# ○ Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
ap1.tenants.create(name: "Alan", age: 27, gender: "m")
ap2.tenants.create(name: "Daniel", age: 22, gender: "m")
ap2.tenants.create(name: "Brad", age: 24, gender: "m")
ap2.tenants.create(name: "Rowan", age: 25, gender: "m")
ap2.tenants.create(name: "Nicky", age: 26, gender: "m")
ap3.tenants.create(name: "Alan", age: 28, gender: "m")
ap3.tenants.create(name: "Eric", age: 30, gender: "m")
ap3.tenants.create(name: "Alex", age: 35, gender: "m")
ap3.tenants.create(name: "Sarah", age: 26, gender: "f")
ap3.tenants.create(name: "Margaret", age: 34, gender: "f")

# ○ queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all

# ○ queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
ap2_tenants = ap2.tenants

# ○ Updates attributes using attribute helper methods for one of the objects you've created
ap3.monthly_rent = 3420

# ○ Saves an object that you updated using attribute helpers to the Database
ap3.save

# ○ Updates an object using the update methods
ten5 = Tenant.all[4]
ten5.update(name: "Nicholas")

# ○ Deletes one of the objects you've created
ap1.destroy




# This will put us into a state of the pry REPL, in which we've established a connection
# with the landlord database and have defined the apartment/tenant Classes as
# ActiveRecord::Base classes.
binding.pry
