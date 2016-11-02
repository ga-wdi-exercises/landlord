require 'bundler/setup'
require 'pry'


require_relative '../db/connection'
require_relative '../models/apartment'
require_relative '../models/tenant'


Tenant.destroy_all
Apartment.destroy_all

#3 objects of the apartment class
apartment_one = Apartment.create(address: "123 1st St", monthly_rent: 500, sqft: 1000, num_beds: 2, num_baths: 1)
apartment_two = Apartment.create(address: "456 1st Rd", monthly_rent: 750, sqft: 1500, num_beds: 2, num_baths: 2)
apartment_three = Apartment.create(address: "789 1st Pl", monthly_rent: 1000, sqft: 2000, num_beds: 3, num_baths: 2)

# 9 objects of the tenant class 
apartment_one.tenants.create([
  {name: "Dashon", age: 27, gender: "m"},
  {name: "Jessica", age: 26, gender: "f"},
  {name: "Bailey", age: 1, gender: "f"}
])

apartment_two.tenants.create([
  {name: "Jose", age: 45, gender: "m"},
  {name: "Manuela", age: 65, gender: "f"},
  {name: "Enrique", age: 30, gender: "m"}
])

apartment_three.tenants.create([
  {name: "Henry", age: 26, gender: "m"},
  {name: "Adriana", age: 27, gender: "f"},
  {name: "Daniela", age: 26, gender: "f"}
])
