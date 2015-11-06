# require "bundler/setup"
# require 'pg'
# require 'active_record'
# require 'pry'
#
#
# require_relative "connection"
# require_relative "../models/apartment"
# require_relative "../models/tenant"
#
#
# Apartment.destroy_all
# Tenant.destroy_all
#
# apt1 = Apartment.create(address: "123 Devon Lane", monthly_rent: 400, sqft: 600, num_beds: 2, num_baths: 2)
# apt2 = Apartment.create(address: "123 Hello Lane", monthly_rent: 800, sqft: 1200, num_beds: 4, num_baths: 2)
# apt3 = Apartment.create(address: "500 Welcome Boulevard", monthly_rent: 1500, sqft: 2000, num_beds: 4, num_baths: 3)
#
# apt1.tenants.create(name:"Matthew" , age: 1 , gender: "male" )
# apt1.tenants.create(name:"Michael" , age: 2 , gender: "male" )
# apt2.tenants.create(name:"Mark" , age: 3 , gender: "male" )
# apt2.tenants.create(name:"Luke" , age: 4 , gender: "male" )
# apt2.tenants.create(name:"John" , age: 5, gender: "male" )
# apt3.tenants.create(name:"Jesus" , age: 6 , gender: "male" )
# apt3.tenants.create(name:"Bill" , age: 7 , gender: "male" )
# apt3.tenants.create(name:"Ted" , age: 8 , gender: "male" )
# apt3.tenants.create(name:"Sam" , age: 8 , gender: "male" )
# # tenants = Tenant.all
# #
# # apt1_tenants = apt1.tenants
# #
# # last_apt = Apartment.last
# # last_apt.update(sqft: 5000)
# #
# # last_apt.delete
# #
# # binding.pry
