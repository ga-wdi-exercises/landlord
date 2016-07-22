require "faker"

require_relative "connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

ap1 = Apartment.create(address: Faker::Address.street_address, monthly_rent: Faker::Number.number(3), sqft: Faker::Number.number(3), num_beds: Faker::Number.number(1) , num_baths: Faker::Number.number(1))
ap2 = Apartment.create(address: Faker::Address.street_address, monthly_rent: Faker::Number.number(3), sqft: Faker::Number.number(3), num_beds: Faker::Number.number(1) , num_baths: Faker::Number.number(1))
ap3 = Apartment.create(address: Faker::Address.street_address, monthly_rent: Faker::Number.number(3), sqft: Faker::Number.number(3), num_beds: Faker::Number.number(1) , num_baths: Faker::Number.number(1))

Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment: ap1)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment: ap2)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment: ap3)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment: ap1)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment: ap2)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment: ap3)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment: ap1)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment: ap2)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment: ap3)
