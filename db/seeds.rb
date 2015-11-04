require 'sinatra'
require 'sinatra/reloader'
require "bundler/setup"
require "pg"
require "pry"
require "active_record"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

# Creates at least 3 instances of the apartment class
erin_apt = Apartment.create(address: "56 Pine Tree Road", monthly_rent: 800, sqft: 1900, num_beds: 4, num_baths: 2)
geoff_apt = Apartment.create(address: "4 Desert Court", monthly_rent: 750, sqft: 700, num_beds: 1, num_baths: 1)
adam_apt = Apartment.create(address: "20 French Quarter", monthly_rent: 1000, sqft: 800, num_beds: 1, num_baths: 1)

# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
erin = erin_apt.tenants.create(name: "Erin Grzech", age: 22, gender: "Female")
steph = erin_apt.tenants.create(name: "Steph Victory", age: 23, gender: "Female")
lanna = erin_apt.tenants.create(name: "Lanna Moire", age: 22, gender: "Female")
becky = erin_apt.tenants.create(name: "Becky Basile", age: 24, gender: "Female")
geoff = geoff_apt.tenants.create(name: "Geoffrey Geise", age: 30, gender: "Male")
adam = adam_apt.tenants.create(name: "Adam Grzech", age: 24, gender: "Male")
fred = Tenant.create(name: "Fred Batton", age: 42, gender: "Male")
wilson = Tenant.create(name: "Wilson York", age: 34, gender: "Male")
quentin = Tenant.create(name: "Quentin Griffith", age: 50, gender: "Male")

# Queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all

# Queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
erin_apt_tenants = Apartment.first.tenants

# Updates attributes using attribute helper methods for one of the objects you've created
fred.name = "Fred Baton"

# Saves an object that you updated using attribute helpers to the Database
fred.save

# Updates an object using the update methods
geoff_apt.update(monthly_rent: 775)

# Deletes one of the objects you've created
adam_apt.destroy

# binding.pry
