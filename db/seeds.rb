require "pg"
require "active_record"
require 'pry'
# require "sinatra"
# require "sinatra/reloader"
require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenants"

Apartment.destroy_all
Tenant.destroy_all

johnsons_apt = Apartment.create(address: "11111 Future Lane", monthly_rent: 3500, sqft: 2000, num_beds: 4, num_baths: 3)
wests_apt = Apartment.create(address: "22222 Where Court", monthly_rent: 5500, sqft: 2500, num_beds: 5, num_baths: 4)
laters_apt = Apartment.create(address: "33333 Food Blvd", monthly_rent: 2500, sqft: 1000, num_beds: 2, num_baths: 2)

Tenant.create(name: "John Johnson", age: 55, gender: "male", apartment_id: 21)
Tenant.create(name: "Mildred Johnson", age: 53, gender: "female", apartment_id: 21)
Tenant.create(name: "Johnny Johnson", age: 8, gender: "male", apartment_id: 21)
Tenant.create(name: "Jimmy Johnson", age: 6, gender: "male", apartment_id: 21)
Tenant.create(name: "Kanye West", age: 35, gender: "male", apartment_id: 22)
Tenant.create(name: "Kim West", age: 32, gender: "female", apartment_id: 22)
Tenant.create(name: "North West", age: 4, gender: "female", apartment_id: 22)
Tenant.create(name: "Seeya Laters", age: 40, gender: "male", apartment_id: 23)
Tenant.create(name: "Catchya Laters", age: 45, gender: "female", apartment_id: 23)

binding.pry

puts "File END"
