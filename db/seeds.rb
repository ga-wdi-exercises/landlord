require_relative "connection"
require_relative "/apartment"
require_relative "/tenant"

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
the_zone = Apartment.create(address: "2214B 15th St", monthly_rent: 700, sqft: 800, num_beds: 3, num_baths: 1)
the_loft = Apartment.create(address: "5050 Cuming St", monthly_rent: 3000, sqft: 600, num_beds: 2, num_baths: 1)
the_box = Apartment.create(address: "1500 Pennsylvania Ave", monthly_rent: 5000, sqft: 200, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
mike = Tenant.create(name: "Mike Sindt", age: 30, gender: "Male", apartment_id: 23)
mark = Tenant.create(name: "Mark Liljehorn", age: 30, gender: "Male", apartment_id: 23)
leland = Tenant.create(name: "Leland Jordon", age: 30, gender: "Male", apartment_id: 23)
dave = Tenant.create(name: "Dave Flynn", age: 30, gender: "Male", apartment_id: 24)
clark = Tenant.create(name: "Clark Wayne", age: 30, gender: "Male", apartment_id: 24)
kent = Tenant.create(name: "Kent West", age: 30, gender: "Male", apartment_id: 24)
roger = Tenant.create(name: "Roger Stevenson", age: 30, gender: "Male", apartment_id: 25)
kendra = Tenant.create(name: "Kendra Smythe", age: 30, gender: "Female", apartment_id: 25)
debbie = Tenant.create(name: "Debbie Dallas", age: 30, gender: "Female", apartment_id: 25)
