require "active_record" # the ORM

require_relative "../models/apartment"
require_relative "../models/tenant"
require_relative "connection"


Tenant.destroy_all
Apartment.destroy_all

home = Apartment.create(address: "10217 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
work = Apartment.create(address: "118 Necomb Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
vacay = Apartment.create(address: "12 Firefox Court", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

home.tenants.create([
  {name: "Jon Grunewald", age: 27, gender: "male"},
  {name: "Emily Smith", age: 29, gender: "female"},
  {name: "Bob Pizza", age: 92, gender: "male"}
  ])

work.tenants.create([
  {name: "Richard Minkins", age: 45, gender: "male"},
  {name: "Melissa Courtney", age: 27, gender: "female"},
  {name: "Clarissa James", age: 27, gender: "female"}
  ])

vacay.tenants.create([
  {name: "Sam Smith", age: 37, gender: "male"},
  {name: "Bob Smith", age: 76, gender: "male"},
  {name: "Pops Mcgops", age: 33, gender: "male"}
  ])
