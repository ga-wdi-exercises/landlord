require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "../models/apartment" #
require_relative "../models/tenant" #

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
ann = Apartment.new(address: "5607 Albia Road", monthly_rent: 5000, sqft: 6000, num_beds: 5, num_baths: 4)
meag = Apartment.new(address: "1336 Q Street", monthly_rent: 4500, sqft: 6000, num_beds: 4, num_baths: 3)
courtney = Apartment.new(address: "619 F Street", monthly_rent: 3500, sqft: 4000, num_beds: 4, num_baths: 2)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
ben = Tenant.new(name: "Ben", age: 20, gender: "male", apartment_id: 13)
andrew = Tenant.new(name: "Andrew", age: 21, gender: "male", apartment_id: 13)
mairead = Tenant.new(name: "Mairead", age: 21, gender: "female", apartment_id: 13)
jenna = Tenant.new(name: "Jenna", age: 18, gender: "female", apartment_id: 13)
neil = Tenant.new(name: "Neil", age: 12, gender: "male", apartment_id: 13)
joseph = Tenant.new(name: "Joseph", age: 19, gender: "male", apartment_id: 13)
owen = Tenant.new(name: "Owen", age: 30, gender: "male", apartment_id: 13)
connor = Tenant.new(name: "Connor", age: 25, gender: "male", apartment_id: 13)
ben = Tenant.new(name: "Meghan", age: 29, gender: "female", apartment_id: 13)
