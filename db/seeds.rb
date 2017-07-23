require_relative "connection"
require_relative "models/apartment"
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all

bat_cave = Apartment.create(address: "123 Batcave Lane", monthly_rent: 2000, sqft: 5000, num_beds: 10, num_baths: 10)
spiderman_house = Apartment.create(address: "456 Spidey Drive", monthly_rent: 3000, sqft: 10000, num_beds: 15, num_baths: 20)
aquaman_house = Apartment.create(address: "789 Water Way", monthly_rent: 200, sqft: 50, num_beds: 1, num_baths: 1)

dave = Tenant.create(name: "Dave", age: 23, gender: "male")
juan = Tenant.create(name: "Juan", age: 25, gender: "male", apartment_id: 4)
steve = Tenant.create(name: "Steve", age: 45, gender: "male", apartment_id: 3)
jessie = Tenant.create(name: "Jessie", age: 30, gender: "female", apartment_id: 17)
laura = Tenant.create(name: "Laura", age: 32, gender: "female", apartment_id: 18)
michelle = Tenant.create(name: "Laura", age: 33, gender: "female", apartment_id: 19)
daisy = Tenant.create(name: "Daisy", age: 34, gender: "female", apartment_id: 20)
kristin = Tenant.create(name: "Kristin", age: 28, gender: "female", apartment_id: 8)
emily = Tenant.create(name: "Emily", age: 40, gender: "female", apartment_id: 1)
