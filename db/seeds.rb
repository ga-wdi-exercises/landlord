require_relative "../db/connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "666 Tubtopia Terrace", monthly_rent: 1, sqft: 1999, num_beds: 1, num_baths: 12)
Apartment.create(address: "123 Bedsofall Pozibul-Werlds Blvd", monthly_rent: 1, sqft: 540, num_beds: 12, num_baths: 1)
Apartment.create(address: "1 Everyplace Ever Place", monthly_rent: 9999, sqft: 9, num_beds: 0, num_baths: 0)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: "Hugh Tub Daughtcaum", age: 19, gender: "TUB", apartment_id: 1)
Tenant.create(name: "King Tubby", age: 56, gender: "Male", apartment_id: 1)
Tenant.create(name: "Cuthbert Calculus", age: 87, gender: "Male", apartment_id: 1)

Tenant.create(name: "Bedward Bedison", age: 19, gender: "BED", apartment_id: 2)
Tenant.create(name: "Beddy Bedder", age: 54, gender: "Male", apartment_id: 2)
Tenant.create(name: "Beddy White", age: 95, gender: "Female", apartment_id: 2)

Tenant.create(name: "Lord Running Clam", age: 924, gender: "Ganymedean Slime Mold", apartment_id: 3)
Tenant.create(name: "Milly Len Yial-O'iPhone", age: 15, gender: "Male", apartment_id: 3)
Tenant.create(name: "Billy Pilgrim", age: -1, gender: "Male", apartment_id: 3)
