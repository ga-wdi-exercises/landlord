require 'sinatra'
require 'active_record'
require 'sinatra/reloader'

require_relative './connection.rb'
require_relative '../models/tenant.rb'
require_relative '../models/apartment.rb'

Tenant.destroy_all
Apartment.destroy_all

Tenant.create(name: "Quinoa Jerreaux", age: 92, gender: "Male", apartment_id: 22)
Tenant.create(name: "Bennett Jerrow", age: 29, gender: "Male", apartment_id: 18)
Tenant.create(name: "Beau JaRow", age: 19, gender: "Male", apartment_id: 24)
Tenant.create(name: "Lucy Fur", age: 99, gender: "Female", apartment_id: 1)
Tenant.create(name: "Alexander Watts", age: 109, gender: "Female", apartment_id: 14)
Tenant.create(name: "Marie Anthony", age: 30, gender: "Female", apartment_id: 16)
Tenant.create(name: "Lizzie Tudor", age: 54, gender: "Female", apartment_id: 11)
Tenant.create(name: "Melissa Plantaganet", age: 41, gender: "Female", apartment_id: 7)
Tenant.create(name: "Henri Tudeur", age: 22, gender: "Male", apartment_id: 19)

Apartment.create(address: "1234 Elm St", monthly_rent: 15, sqft: 2400, num_beds: 2, num_baths: 3)
Apartment.create(address: "500 Bou Le Vard St.", monthly_rent: 800, sqft: 2000, num_beds: 1, num_baths: 2)
Apartment.create(address: "400 Maple St.", monthly_rent: 800, sqft: 2000, num_beds: 3, num_baths: 1)
