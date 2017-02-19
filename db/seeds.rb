require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

Tenant.destroy_all
Apartment.destroy_all

the_den = Apartment.create(id: 20, address: "12 Main Street", monthly_rent: 750, sqft: 1000, num_beds: 2, num_baths: 1),
the_dungeon = Apartment.create(id: 21, address: "13 Main Street", monthly_rent: 850, sqft: 1200, num_beds: 3, num_baths: 2),
the_lair = Apartment.create(id: 22, address: "14 Main Street", monthly_rent: 950, sqft: 1400, num_beds: 3, num_baths: 3)

avery = Tenant.create(name: "Avery", age: 26, gender: "Female", apartment_id: 20),
bill = Tenant.create(name: "Bill", age: 62, gender: "Male", apartment_id: 20),
candice = Tenant.create(name: "Candice", age: 54, gender: "Female", apartment_id: 20),
dillan = Tenant.create(name: "Dillan", age: 33, gender: "Male", apartment_id: 21),
everett = Tenant.create(name: "Everett", age: 38, gender: "Male", apartment_id: 21),
fritz = Tenant.create(name: "Fritz", age: 40, gender: "Male", apartment_id: 21),
georgia = Tenant.create(name: "Georgia", age: 35, gender: "Female", apartment_id: 22),
happy = Tenant.create(name: "Happy", age: 32, gender: "Female", apartment_id: 22),
ivan = Tenant.create(name: "Ivan", age: 28, gender: "Male", apartment_id: 22)
