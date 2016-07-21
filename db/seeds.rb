require "faker"

require_relative "connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment_id: 21)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment_id: 22)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment_id: 23)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment_id: 21)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment_id: 22)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment_id: 23)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment_id: 21)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'female', apartment_id: 22)
Tenant.create(name: Faker::StarWars.character, age: Faker::Number.number(2) , gender: 'male', apartment_id: 23)

Apartment.create(address: Faker::Address.street_address, monthly_rent: Faker::Number.number(3), sqft: Faker::Number.number(3), num_beds: Faker::Number.number(1) , num_baths: Faker::Number.number(1))
Apartment.create(address: Faker::Address.street_address, monthly_rent: Faker::Number.number(3), sqft: Faker::Number.number(3), num_beds: Faker::Number.number(1) , num_baths: Faker::Number.number(1))
Apartment.create(address: Faker::Address.street_address, monthly_rent: Faker::Number.number(3), sqft: Faker::Number.number(3), num_beds: Faker::Number.number(1) , num_baths: Faker::Number.number(1))
