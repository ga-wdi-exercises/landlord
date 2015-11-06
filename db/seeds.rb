require "bundler/setup"
require "pry"
require "pg"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

binding.pry

Apartment.create([
  {address: "504 E St NE", monthly_rent: 1100, sqft: 10, num_beds: 2, num_baths: 2},
  {address: "1 World Trade", monthly_rent: 1000000, sqft: 10000, num_beds: 1, num_baths: 100},
  {address: "30 Rockefeller", monthly_rent: 500, sqft: 6000, num_beds: 70, num_baths: 40},
  ])

Apartment.all[0].tenants.create([
  {name: "teddy", age: 24, gender: "m"}
  {name: "zac", age: 30, gender: "m"}
])

Apartment.all[1].tenants.create([
  {name: "sam", age: 25, gender: "m"}
])

all_tenants = Tenant.all

Tenant.first.update(age: 25)

Tenant.all[1].destroy
