require 'active_record'
require_relative 'connection'

# models
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

funnie_house = Apartment.create(address: "123 Bluffington Ave", monthly_rent: 1800, sqft: 2000, num_beds: 4, num_baths: 2)
valentine_house = Apartment.create(address: "456 Bluffington Ave", monthly_rent: 1900, sqft: 2500, num_beds: 5, num_baths: 2)
mayonnaise_house = Apartment.create(address: "987 Bluffington Ave", monthly_rent: 1600, sqft: 800, num_beds: 2, num_baths: 1)

funnie_house.tenants.create(name: "Doug Funnie", age: 11, gender: "Male")
funnie_house.tenants.create(name: "Phil Funnie", age: 43, gender: "Male")
funnie_house.tenants.create(name: "Judy Funnie", age: 15, gender: "Female")
funnie_house.tenants.create(name: "Theda Funnie", age: 43, gender: "Female")
funnie_house.tenants.create(name: "Cleopatra Funnie", age: 1, gender: "Female")

mayonnaise_house.tenants.create(name: "Patti Mayonnaise", age: 11, gender: "Female")
mayonnaise_house.tenants.create(name: "Chad Mayonnaise", age: 40, gender: "Male")

valentine_house.tenants.create(name: "Skeeter Valentine", age: 11, gender: "Male")
valentine_house.tenants.create(name: "Dale Valentine", age: 1, gender: "Male")
