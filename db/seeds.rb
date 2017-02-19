require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

morella = Apartment.create(address:'5524 Morella Ave.', monthly_rent:1200, sqft:900, num_beds:1, num_baths:1)
margate = Apartment.create(address:'11691 Margate St.', monthly_rent:1750, sqft:1000, num_beds:2, num_baths:1)
simmons = Apartment.create(address:'1603 Simmons Dr.', monthly_rent:5500, sqft:4000, num_beds:4, num_baths:4)
jordan = Tenant.create(name: "Jordan Ballard", age: 31, gender: "Male", apartment_id: morella.id)
daniel = Tenant.create(name: "Daniel Ballard", age: 37, gender: "Male", apartment_id: morella.id)
michael = Tenant.create(name: "Michael Ballard", age: 30, gender: "Male", apartment_id: morella.id)
andrea = Tenant.create(name: "Andrea Sharp", age: 35, gender: "Female", apartment_id: margate.id)
samantha = Tenant.create(name: "Samantha Ballard", age: 32, gender: "Female", apartment_id: simmons.id)
campbell = Tenant.create(name: "Campbell Ballard", age: 4, gender: "Male", apartment_id: simmons.id)
david = Tenant.create(name: "David Ballard", age: 59, gender: "Male", apartment_id: margate.id)
pam = Tenant.create(name: "Pam Ballard", age: 60, gender: "Female", apartment_id: margate.id)
carly = Tenant.create(name: "Carly Ballard", age: 24, gender: "Female", apartment_id: simmons.id)
