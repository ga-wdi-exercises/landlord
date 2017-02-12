require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"


Tenant.destroy_all
Apartment.destroy_all

johnson_house = Apartment.create(address: "123 Johnson St", monthly_rent: 2000, sqft: 1000, num_beds: 2, num_baths: 1)
wilson_house = Apartment.create(address: "456 Wilson Ave", monthly_rent: 5000, sqft: 10000, num_beds: 5, num_baths: 4)
franklin_house = Apartment.create(address: "789 Franklin Lane", monthly_rent: 6000, sqft: 8000, num_beds: 4, num_baths: 3)



johnson_house.tenants.create ([
  {name: "Olivia Johnson", age: 40, gender: "Female"},
  {name: "Bob Johnson", age: 45, gender: "Male"}
  ])
#
wilson_house.tenants.create ([
  {name: "Katherine Wilson", age: 49, gender: "Female"},
  {name: "Joe Wilson", age: 51, gender: "Male"},
  {name: "Seth Wilson", age: 21, gender: "Male"},
  {name: "Grace Wilson", age: 18, gender: "Female"}
  ])

franklin_house.tenants.create ([
  {name: "Lisa Franklin", age: 35, gender: "Female"},
  {name: "Jeff Franklin", age: 38, gender: "Male"},
  {name: "Molly Franklin", age: 12, gender: "Female"}
  ])

binding.pry
puts "end of file"
