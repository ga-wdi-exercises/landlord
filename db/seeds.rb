require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "2342 Blah St",monthly_rent: 8000,sqft: 450,num_beds: 2,num_baths: 1)
apt2 = Apartment.create(address: "643 Dingus Rd.",monthly_rent: 2341,sqft: 1000,num_beds: 2,num_baths: 2)
apt3 = Apartment.create(address: "Jabroni Drive",monthly_rent: 450,sqft: 750,num_beds: 1,num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
bill = Tenant.create(name: "Bill Cunningham",age: 89,gender: "Male",apartment_id: 4)
james = Tenant.create(name: "James Rick",age: 10,gender: "Male",apartment_id: 6)
carol = Tenant.create(name: "Carol Carolson",age: 45,gender: "Female",apartment_id: 3)
bobby = Tenant.create(name: "Bobby Robert Jr.",age: 34,gender: "Male",apartment_id: 7)
wil = Tenant.create(name: "Wil Liem",age: 24,gender: "Male",apartment_id: 8)
gene = Tenant.create(name: "Gene Hamburger",age: 12,gender: "Male",apartment_id: 1)
quinn = Tenant.create(name: "Quinn Ton",age: 42,gender: "Male",apartment_id: 8)
liz = Tenant.create(name: "Lizzy Izzard",age: 26,gender: "Female",apartment_id: 1)
guy = Tenant.create(name: "Buddy Buy",age: 124,gender: "Male",apartment_id: 25)
