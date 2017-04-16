require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

riverway = Apartment.create(address: "360 Riverway", monthly_rent: 1800, sqft: 1000, num_beds: 1, num_baths: 1)

canbridge = Apartment.create(address: "100 Emeral Necklace", monthly_rent: 2000, sqft: 1500, num_beds: 2, num_baths: 1)

madison = Apartment.create(address: "2628 Madison Park", monthly_rent: 2800, sqft: 3000, num_beds: 3, num_baths: 3)

ryan = Tenant.create(name: "Ryan Dungey", age: 35, gender: "Male", apartment_id: 3)

juliana = Tenant.create(name: "Juliana Daniels", age: 30, gender: "Female", apartment_id: 2)

bill = Tenant.create(name: "Bill Ashman", age: 60, gender: "Male", apartment_id: 3)

penny = Tenant.create(name: "Penny Ashman", age: 58, gender: "Female", apartment_id: 3)

chad = Tenant.create(name: "Chad Reed", age: 40, gender: "Male", apartment_id: 1)

carol = Tenant.create(name: "Carol Burnet", age: 35, gender: "Female", apartment_id: 1)

cindy = Tenant.create(name: "Cindy Crawford", age: 50, gender: "Female", apartment_id: 2)

ken = Tenant.create(name: "Ken Roczen", age: 48, gender: "Male", apartment_id: 2)

mimy = Tenant.create(name: "Mimy Ashman", age: 12, gender: "Female", apartment_id: 3)

binding.pry
