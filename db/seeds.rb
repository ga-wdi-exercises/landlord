require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apt_one = Apartment.create(address: "Jared's Apt", monthly_rent: 1800, sqft: 6000, num_beds: 20, num_baths: 1)
apt_two = Apartment.create(address: "cool land", monthly_rent: 2300, sqft: 2500, num_beds: 2, num_baths: 5)
Apartment.create(address: "not cool land", monthly_rent: 2800, sqft: 300, num_beds: 3, num_baths: 2)
Tenant.create(name: "broman", age: "32", gender: "male", apartment: apt_one)
johnny = Tenant.create(name: "browoman", age: "22", gender: "female", apartment: apt_two)
brosauce = Tenant.create(name: "brosauce", age: "26", gender: "male", apartment: apt_one)
Tenant.create(name: "bra", age: "27", gender: "female", apartment: apt_two)
Tenant.create(name: "bruh", age: "29", gender: "male", apartment: apt_one)
Tenant.create(name: "bromigo", age: "12", gender: "male")

all_tenants = Tenant.all

brosauce.name = "RickyJonRonald"

brosauce.save

apt_one.update = (address: "Japan", monthly_rent: 1000, sqft: 30, num_beds: 1, num_baths: 1)

johnny.destroy
