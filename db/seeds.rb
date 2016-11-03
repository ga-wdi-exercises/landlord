require "active_record"

require_relative "../models/apartment"
require_relative "../models/tenant"
require_relative "connection"

Tenant.destroy_all
Apartment.destroy_all

apt1 = Apartment.create(address: "657 Irving St", monthly_rent: 3200, sqft: 2000, num_beds: 4, num_baths: 2)
apt2 = Apartment.create(address: "658 Irving St", monthly_rent: 3100, sqft: 1900, num_beds: 3, num_baths: 2)
apt3 = Apartment.create(address: "659 Irving St", monthly_rent: 3000, sqft: 1800, num_beds: 3, num_baths: 1)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
tenant1 = Tenant.create(name:"Sam C" , age: 26, gender:"Male", apartment_id:21)
tenant2 = Tenant.create(name:"Sam A" , age: 27, gender:"Female", apartment_id:22)
tenant3 = Tenant.create(name:"Sam B" , age: 28, gender:"Male", apartment_id:23)
tenant4 = Tenant.create(name:"Sam D" , age: 29, gender: "Female", apartment_id:24)
tenant5 = Tenant.create(name:"Sam E" , age: 30, gender: "Male", apartment_id:25)
tenant6 = Tenant.create(name:"Sam F" , age: 31, gender: "Female", apartment_id:25)
tenant7 = Tenant.create(name:"Sam G" , age: 32, gender: "Male", apartment_id:26)
tenant8 = Tenant.create(name:"Sam H" , age: 33, gender: "Female", apartment_id:27)
tenant9 = Tenant.create(name:"Sam I" , age: 34, gender: "Male", apartment_id:27)
