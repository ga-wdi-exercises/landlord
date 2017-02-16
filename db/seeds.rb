# require 'bundler/setup'
# require 'pry'

require_relative '../db/connection.rb'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apt1 = Apartment.create(address: "345 Petunia Lane", monthly_rent: 3452, sqft: 1000, num_beds: 2, num_baths: 1)
apt2 = Apartment.create(address: "2312 Walker Lane", monthly_rent: 312, sqft: 100, num_beds: 1, num_baths: 1)
apt3 = Apartment.create(address: "389 Georgia White Blvd", monthly_rent: 4452, sqft: 1241, num_beds: 3, num_baths: 2)

apt1.tenants.create([
  {name: "Carlos Rodriguez", age: 54, gender: "Male"},
  {name: "Pablo Escobar", age: 34, gender: "Male"},
  {name: "Jose Jalepeno", age: 12, gender: "Male"}
  ])
apt2.tenants.create([
  {name: "Jack Reacher", age: 32, gender: "Male"},
  {name: "Elaine Crofton", age: 31, gender: "Female"},
  {name: "Hannah Banana", age: 25, gender: "Female"}
  ])
apt3.tenants.create([
  {name: "Ted Mosby", age: 29, gender: "Male"},
  {name: "Marshall Ericson", age: 30, gender: "Male"},
  {name: "Lily Aldrin", age: 29, gender: "Female"}
  ])
