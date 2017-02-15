require "bundler/setup" #
require "pg"
require "active_record"
require "pry"
require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"
Tenant.destroy_all
Apartment.destroy_all



puts "end of application"

Apartment.new(address: "26 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)
Apartment.new(address: "27 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)
Apartment.new(address: "28 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)

Tenant.new(name: "John", age: 20, gender: "male")
Tenant.new(name: "Kara", age: 21, gender: "female")
Tenant.new(name: "Susan", age: 22, gender: "female")
Tenant.new(name: "Tia", age: 25, gender: "female")
Tenant.new(name: "Tamara", age: 25, gender: "male")
Tenant.new(name: "Cathy", age: 40, gender: "female")
Tenant.new(name: "George", age: 30, gender: "male")
Tenant.new(name: "Lady", age: 50, gender: "female")
binding.pry
