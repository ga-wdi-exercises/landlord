require 'active_record'
require_relative 'connection'

# models
require_relative '../models/apartment'
require_relative '../models/tenant'

# data
Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
apartment_one = Apartment.create(address: "1 1st. NW", monthly_rent: 1000, sqft: 100, num_beds: 2, num_baths: 1)
apartment_two = Apartment.create(address: "2 2st. NW", monthly_rent: 2000, sqft: 200, num_beds: 3, num_baths: 2)
apartment_three = Apartment.create(address: "3 3st. NW", monthly_rent: 3000, sqft: 300, num_beds: 4, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
tenant_one = Tenant.create(name: "Arther King", age: 20, gender: "male", apartment_id: 3)
tenant_two = Tenant.create(name: "John Sena", age: 30, gender: "male", apartment_id: 3)
tenant_three = Tenant.create(name: "Beyonce", age: 40, gender: "female", apartment_id: 3)
tenant_four = Tenant.create(name: "Mike Nabil", age: 30, gender: "male", apartment_id: 1)
tenant_five = Tenant.create(name: "Mark Alton", age: 22, gender: "male", apartment_id: 1)
tenant_six = Tenant.create(name: "Christina White", age: 40, gender: "female", apartment_id: 1)
tenant_seven = Tenant.create(name: "Mary Brown", age: 28, gender: "female", apartment_id: 2)
tenant_eight = Tenant.create(name: "Snow White", age: 50, gender: "female", apartment_id: 2)
tenant_nine = Tenant.create(name: "Arther Black", age: 25, gender: "male", apartment_id: 2)
