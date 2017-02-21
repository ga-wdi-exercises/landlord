require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

# Creates at least 3 instances of the apartment class
# simp_house = Apartment.create(address: "742 Evergreen Terrace", monthly_rent: 1200, sqft: 2000, num_beds: 5, num_baths: 2)
# whitehouse = Apartment.create(address: "1600 Pennsylvania Ave", monthly_rent: 15000, sqft: 30000, num_beds: 15, num_baths: 8)
# ga = Apartment.create(address: "1133 15th St", monthly_rent: 0, sqft: 20000, num_beds: 5, num_baths: 2)
#
# # Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
# simp_house.tenants.create(name: "Homer Simpson", age: 38, gender: "Male")
# simp_house.tenants.create(name: "Marge Simpson", age: 34, gender: "Female")
# simp_house.tenants.create(name: "Bart Simpson", age: 10, gender: "Male")
# simp_house.tenants.create(name: "Lisa Simpson", age: 8, gender: "Female")
# simp_house.tenants.create(name: "Maggie Simpson", age: 1, gender: "Female")
# simp_house.tenants.create(name: "Abraham Simpson", age: 83, gender: "Male")
# whitehouse.tenants.create(name: "Barack Obama", age: 54, gender: "Male")
# whitehouse.tenants.create(name: "Michelle Obama", age: 51, gender: "Female")
# me = ga.tenants.create(name: "Tyler Crosse", age: 26, gender: "Male")
#
# # queries for all instances of the Tenant class and stores it in a variable of your choice
# tens = Tenant.all
#
# # queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
# obamas = whitehouse.tenants.all
#
# # Updates attributes using attribute helper methods for one of the objects you've created
# me.age = 25
#
# # Saves an object that you updated using attribute helpers to the Database
# me.save
#
# # Updates an object using the update methods
# me.update(age: 26)
#
# # Deletes one of the objects you've created
# me.destroy
#
# binding.pry
