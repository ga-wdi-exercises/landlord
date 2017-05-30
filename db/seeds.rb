require "active_record"
require "pry"


require_relative "db/connection"
require_relative "models/apartment.rb"
require_relative "models/tenant.rb"

Tenant.destroy_all
Apartment.destroy_all


new_apartment = Apartment.create([
  {address: "1301 U st", monthly_rent: 2100,  sqft: 1000, num_beds: 1, num_baths: 1},
  {address: "1302 U st", monthly_rent: 2500,  sqft: 1100, num_beds: 2, num_baths: 2},
  {address: "1303 U st", monthly_rent: 3400,  sqft: 1200, num_beds: 2, num_baths: 2}
  ])


new_tenant_one = Apartment.all[0].tenants.create([
  {name: "Roy", age: 29, gender: "m"},
  {name: "Troy", age: 16, gender: "m"},
  {name: "Bob", age: 35, gender: "m"}
  ])
new_tenant_two = Apartment.all[1].tenants.create([
  {name: "Susan", age: 27, gender: "f"},
  {name: "Lilly", age: 32, gender: "f"},
  {name: "Theo", age: 28, gender: "m"}
  ])
new_tenant_three = Apartment.all[2].tenants.create([
  {name: "Jessica", age: 21, gender: "f"},
  {name: "Clare", age: 29, gender: "f"},
  {name: "Basil", age: 28, gender: "m"}
  ])
