require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/tenant"
require_relative "../models/apartment"
require_relative "../db/connection"

Apartment.destroy_all
Tenant.destroy_all
# destroys existing data in database
#Creates at least 3 instances of the apartment class

col_heights_apt = Apartment.create(address: "1704 Monroe St", monthly_rent: 1200,  sqft: 1200, num_beds: 2, num_baths: 2)
dupont_apt = Apartment.create(address: "774 16th St", monthly_rent: 1800,  sqft: 800, num_beds: 2, num_baths: 1)
ad_mo_apt = Apartment.create(address: "902 Kenyon St", monthly_rent: 100, sqft: 1100, num_beds: 2, num_baths: 2)

# # create at least 9 instances of tenant class - at least 5 must be long to an apartment
col_heights_apt.tenants.create(name: "Marvin Radial", age: 25, gender: "Male")
col_heights_apt.tenants.create(name: "Freddy Vescent", age: 21, gender: "Male")
dupont_apt.tenants.create(name: "Kate Wannabe", age: 30, gender: "Female")
dupont_apt.tenants.create(name: "Sally Fessler", age: 45, gender: "Female")
dupont_apt.tenants.create(name: "Sara Robatille", age: 35, gender: "Female")

betsy = Tenant.create(name: "Betsy Mildren", age: 50, gender: "Female", apartment_id: col_heights_apt.id)
cindi = Tenant.create(name: "Cindi Nunez", age: 45, gender: "Female", apartment_id: dupont_apt.id)
jay = Tenant.create(name: "Jay Fathi", age: 49, gender: "Male", apartment_id: ad_mo_apt.id)


# # query for all objects of the Tenant class, store it in a variable
tenant = Tenant.all

#
# # query for all instances of the Tenant class that belong to the first Apartment you created
colheights = col_heights_apt.tenants

# update any one of your objects you've created using attribute helper methods

betsy.name = "Karen"
# save that object you just updated to the database
betsy.save
# update an object using the update method
jay.update(name: "Jay Forealizhi")
# delete an object
jay.destroy

binding.pry
