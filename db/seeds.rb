require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "connection"
require_relative "../models/apartments"
require_relative "../models/tenants"

Tenant.destroy_all
Apartment.destroy_all



zanehs_house = Apartment.create(address: "29 Fairhill Lane", monthly_rent: 200, sqft: 3000, num_beds: 3, num_baths: 4)
grandmas_house = Apartment.create(address: "6508 Springbrook Lane", monthly_rent: 400, sqft: 3200, num_beds: 4, num_baths: 6)
random_house = Apartment.create(address: "670 Fairy Lane", monthly_rent: 900, sqft: 2000, num_beds: 2, num_baths: 1)

Tenant.create(name: "Zaneh", age: 23, gender: "female", apartment_id: zanehs_house[:id])
Tenant.create(name: "Ajeh", age: 21, gender: "female", apartment_id: zanehs_house[:id])
Tenant.create(name: "Keisha", age: 47, gender: "female", apartment_id: zanehs_house[:id])
Tenant.create(name: "Savon", age: 22, gender: "male", apartment_id: zanehs_house[:id])
Tenant.create(name: "Thomas", age: 76, gender: "male", apartment_id: grandmas_house[:id])
Tenant.create(name: "Mattie", age: 70, gender: "female", apartment_id: grandmas_house[:id])
Tenant.create(name: "Fairy One", age: 34, gender: "female", apartment_id: random_house[:id])
Tenant.create(name: "Fairy Two", age: 30, gender: "female", apartment_id: random_house[:id])
Tenant.create(name: "Fairy Three", age: 36, gender: "male", apartment_id: random_house[:id])

binding.pry
