# loads necessary files
require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

# To ensure running seeds script clears my DB first
Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "111 Huey Way", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
apt2 = Apartment.create(address: "222 Duey St", monthly_rent: 2000, sqft: 2000, num_beds: 2, num_baths: 3)
apt3 = Apartment.create(address: "333 Luey Ter", monthly_rent: 3000, sqft: 3000, num_beds: 3000, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
ten1 =Tenant.create(name: "Mike Brady", age: 40 , gender: "Male", apartment_id: 33)
ten2 =Tenant.create(name: "Carol Brady", age: 40 , gender: "Female", apartment_id: 33)
ten3 =Tenant.create(name: "Marcia Brady", age:  16, gender: "Female", apartment_id: 34)
ten4 =Tenant.create(name: "Jan Brady", age:  14, gender: "Female", apartment_id: 34)
ten5 =Tenant.create(name: "Cindy Brady", age:  9, gender: "Female", apartment_id: 34)
ten6 =Tenant.create(name: "Greg Brady", age:  17, gender: "Male", apartment_id: 34)
ten7 =Tenant.create(name: "Peter Brady", age:  15, gender: "Male", apartment_id: 34)
ten8 =Tenant.create(name: "Bobby Brady", age:  10, gender: "Male", apartment_id: 34)
ten9 =Tenant.create(name: "Alice Brady", age:  40, gender: "Female", apartment_id: 35)
