require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "../config/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "../models/apartment" # require the Student class definition that we defined in the models/student.rb file
require_relative "../models/tenant"

# This will put us into a state of the pry REPL, in which we've established a connection
# with the wdi database and have defined the Student Class as an
# ActiveRecord::Base class.

Apartment.destroy_all
Tenant.destroy_all



#Creates at least 3 instances of the apartment class

apartment = Apartment.create(
  [
    {address: '3500 Park Blvd', monthly_rent: 1700, sqft: 1200, num_beds:2, num_baths: 1.5},
    {address: '1222 Swallow Ln', monthly_rent: 5600, sqft: 3500, num_beds: 5, num_baths: 3},
    {address: '909 Gallows Rd', monthly_rent: 1500, sqft: 1000, num_beds: 2, num_baths: 1}
  ])

  binding.pry


#Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
tenant = Tenant.create(
  [
    {name: 'Rob', age: 35, gender: 'm', apartment_id: 1},
    {name: 'Lowe', age: 25, gender: 'm', apartment_id: 2},
    {name: 'Brad', age: 21, gender: 'm', apartment_id: 1},
    {name: 'Pitt', age: 29, gender: 'm', apartment_id: 2},
    {name: 'Tom', age: 40, gender: 'm', apartment_id: 3},
    {name: 'Cruise', age: 31, gender: 'm'},
    {name: 'Chief', age: 11, gender: 'm'},
    {name: 'Kief', age: 21, gender: 'm'},
    {name: 'Big Berta', age: 61, gender: 'f'}
  ])



#queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all


#queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
tenants_apartment_2 = Tenant.all.where(apartment_id: 2);

#Updates attributes using attribute helper methods for one of the objects you've created
rob = Tenant.find_by(name: "Rob")
rob.name = "NotRob"
#Saves an object that you updated using attribute helpers to the Database
rob.save

#Updates an object using the update methods
tom.update(age: 25)

#Deletes one of the objects you've created
tom.destroy
