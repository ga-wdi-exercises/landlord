require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "123 Address Street", monthly_rent: 9999, sqft: 50, num_beds: 9, num_baths: 0)
Apartment.create(address: "1234 Place Blvd", monthly_rent: 20, sqft: 2000, num_beds: 0, num_baths: 5)
Apartment.create(address: "54321 Here Is A House Circle", monthly_rent: 2350, sqft: 2500, num_beds: 4, num_baths: 3)

Tenant.create(name: "Name", age: 22, gender: "male", apartment_id: 3)
Tenant.create(name: "A Guy", age: 25, gender: "male", apartment_id: 2)
Tenant.create(name: "Tenantman", age: 42, gender: "male", apartment_id: 1)
Tenant.create(name: "Tenantwoman", age: 30, gender: "female", apartment_id: 3)
Tenant.create(name: "Someone", age: 80, gender: "female", apartment_id: 1)
Tenant.create(name: "Name 2", age: 12, gender: "male", apartment_id: 8)
Tenant.create(name: "Database Data", age: 2, gender: "female", apartment_id: 2)
Tenant.create(name: "Lorem Ipsum", age: 58, gender: "male", apartment_id: 1)
Tenant.create(name: "Word", age: 65, gender: "male", apartment_id: 1)
