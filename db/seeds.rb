require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection.rb"
require_relative "../models/apartment.rb"
require_relative "../models/tenant.rb"

#Copied directly from solution due to time constraint, modified slightly
Apartment.destroy_all
Tenant.destroy_all
# create at least 3 objects of the apartment class
Apartment.create([
  {address: "69 Werewolf St", monthly_rent: 1800,  sqft: 1100, num_beds: 1, num_baths: 1},
  {address: "23 Hawk Lane", monthly_rent: 2100,  sqft: 1200, num_beds: 2, num_baths: 2},
  {address: "80 Headhunter Dr", monthly_rent: 2300,  sqft: 1300, num_beds: 3, num_baths: 3}
  ])
# create at least 9 objects(at least 5 must be long to an apartment)
Apartment.all[0].tenants.create([
  {name: "bob", age: 24, gender: "f"},
  {name: "bill", age: 26, gender: "m"},
  {name: "bessy", age: 32, gender: "m"}
  ])
Apartment.all[1].tenants.create([
  {name: "megan", age: 52, gender: "f"},
  {name: "mary", age: 44, gender: "f"},
  {name: "mark", age: 28, gender: "m"}
  ])
Apartment.all[2].tenants.create([
  {name: "lou", age: 32, gender: "m"},
  {name: "lindsay", age: 24, gender: "f"},
  {name: "leroy", age: 37, gender: "f"}
  ])
