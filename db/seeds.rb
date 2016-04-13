require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

morella = Apartment.new(address:'5524 Morella Ave.', monthly_rent:1200, sqft:900, num_beds:1, num_baths:1)
margate = Apartment.new(address:'11691 Margate St.', monthly_rent:1750, sqft:1000, num_beds:2, num_baths:1)
simmons = Apartment.new(address:'1603 Simmons Dr.', monthly_rent:5500, sqft:4000, num_beds:4, num_baths:4)
jordan = Tenant.new(name: "Jordan Ballard", age: 31, gender: "Male", apartment_id: 21)
daniel = Tenant.new(name: "Daniel Ballard", age: 37, gender: "Male", apartment_id: 20)
michael = Tenant.new(name: "Michael Ballard", age: 30, gender: "Male", apartment_id: 20)
andrea = Tenant.new(name: "Andrea Sharp", age: 35, gender: "Female", apartment_id: 22)
samantha = Tenant.new(name: "Samantha Ballard", age: 32, gender: "Female", apartment_id: 21)
campbell = Tenant.new(name: "Campbell Ballard", age: 4, gender: "Male", apartment_id: 21)
david = Tenant.new(name: "David Ballard", age: 59, gender: "Male", apartment_id: 22)
pam = Tenant.new(name: "Pam Ballard", age: 60, gender: "Female", apartment_id: 22)
carly = Tenant.new(name: "Carly Ballard", age: 24, gender: "Female", apartment_id: 20)
