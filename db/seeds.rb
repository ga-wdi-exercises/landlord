require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "1234 House Drive", monthly_rent: 200, sqft: 120, num_beds: 1, num_baths: 1)
Apartment.create(address: "2500 Panda Bear Lane", monthly_rent: 2000, sqft: 1200, num_beds: 2, num_baths: 1)
Apartment.create(address: "5600 Pants Circle", monthly_rent: 2500, sqft: 2400, num_beds: 3, num_baths: 2)

Tenant.create(name: "Madonna Donna", age: 100 , gender: "female", apartment_id: 3)
Tenant.create(name: "Frank Frankleburg", age: 25 , gender: "male", apartment_id: 7)
Tenant.create(name: "Felicia Bye", age: 37, gender: "female", apartment_id: 5)
Tenant.create(name: "Unicorn Glitterfarts", age: 12, gender: "female", apartment_id: 6)
Tenant.create(name: "Pumpkin Piecakes", age: 6, gender: "male", apartment_id: 1)
Tenant.create(name: "Sparkle Scooterpants", age: 55, gender: "female", apartment_id: 9)
Tenant.create(name: "Person Persons", age: 45, gender: "male", apartment_id: 3)
Tenant.create(name: "Manhands Pearson", age: 22, gender: "female", apartment_id: 2)
Tenant.create(name: "Pokemon NoMore", age: 85, gender: "male", apartment_id: 4)

binding.pry
