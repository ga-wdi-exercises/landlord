require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

Apartment.create(address: "90210 Beverly Hills", monthly_rent: 3100, sqft: 1000, num_beds: 5, num_baths: 3)
Apartment.create(address: "845 Rotonda Road", monthly_rent: 1700, sqft: 800, num_beds: 2, num_baths: 2)
Apartment.create(address: "76 Matera Street", monthly_rent: 900, sqft: 600, num_beds: 2, num_baths: 2)

Tenant.create(name: "Brandon", age: 19, gender: "male", apartment_id: 1)
Tenant.create(name: "Jacob", age: 29, gender: "male", apartment_id: 1)
Tenant.create(name: "Kyrie", age: 25, gender: "male", apartment_id: 1)
Tenant.create(name: "Irving", age: 36, gender: "male", apartment_id: 2)
Tenant.create(name: "Jessica", age: 21, gender: "female", apartment_id: 2)
Tenant.create(name: "Emma", age: 26, gender: "female", apartment_id: 2)
Tenant.create(name: "Danny", age: 38, gender: "male", apartment_id: 3)
