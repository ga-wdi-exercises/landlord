require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apt1 = Apartment.create(address: "666 Hades Lane",  monthly_rent: 666, sqft: 666, num_beds: 0, num_baths: 0)
apt2 = Apartment.create(address: "111 Somewhere",  monthly_rent: 1099, sqft: 2000, num_beds: 5, num_baths: 1)
apt3 = Apartment.create(address: "808 Kitteh Palace",  monthly_rent: 20, sqft: 1000, num_beds: 1, num_baths: 2)

jan = Tenant.create(name: "Jan", age: 30, gender: "female", apartment_id: 21)
stan = Tenant.create(name: "Stan", age: 40, gender: "male", apartment_id: 21)
dan = Tenant.create(name: "Dan", age: 10, gender: "male", apartment_id: 21)
deb = Tenant.create(name: "Deb", age: 50, gender: "female", apartment_id: 22)
jeb = Tenant.create(name: "Jeb", age: 52, gender: "male", apartment_id: 22)
zeb = Tenant.create(name: "Zeb", age: 43, gender: "male", apartment_id: 22)
pat = Tenant.create(name: "Pat", age: 80, gender: "male", apartment_id: 23)
kat = Tenant.create(name: "Kat", age: 87, gender: "female", apartment_id: 23)
nat = Tenant.create(name: "Nat", age: 99, gender: "male", apartment_id: 23)
