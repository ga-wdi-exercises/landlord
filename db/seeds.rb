require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

Apartment.destroy_all
Tenant.destroy_all

the_bat_cave = Apartment.create(address: "123 Main St", monthly_rent: 2000, sqft: 600, num_beds: 2, num_baths: 1)
gotham_police_headquarters = Apartment.create(address: "225 Vermont Ave", monthly_rent: 4600, sqft: 1950, num_beds: 4, num_baths: 2)
jokers_lair = Apartment.create(address: "666 Evil Way", monthly_rent: 450, sqft: 1100, num_beds: 3, num_baths: 1)

batman = Tenant.create(name: "Bruce", age: 30, gender: "Male", apartment: the_bat_cave)
robin = Tenant.create(name: "Dick", age: 16, gender: "Male", apartment: the_bat_cave)
batgirl = Tenant.create(name: "Barbara", age: 16, gender: "Female", apartment: the_bat_cave)
alfred = Tenant.create(name: "Alfred", age: 59, gender: "Male", apartment: the_bat_cave)
commissioner = Tenant.create(name: "Gordon", age: 64, gender: "Male", apartment: gotham_police_headquarters)
detective = Tenant.create(name: "Bullock", age: 45, gender: "Male", apartment: gotham_police_headquarters)
the_joker = Tenant.create(name: "Mr. J", age: 35, gender: "Male", apartment: jokers_lair)
harley_quinn = Tenant.create(name: "Harley", age: 30, gender: "Female", apartment: jokers_lair)

binding.pry
