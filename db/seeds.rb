require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apt1 = Apartment.create(address: "Parts Unknown",  monthly_rent: 9001, sqft: 9001, num_beds: 1, num_baths: 1)
apt2 = Apartment.create(address: "Death Valley",  monthly_rent: 666, sqft: 666, num_beds: 666, num_baths: 666)
apt3 = Apartment.create(address: "Dudleyville",  monthly_rent: 100, sqft: 2000, num_beds: 2, num_baths: 2)

taker = Tenant.create(name: "Undertaker", age: 99, gender: "male", apartment_id: 21)
ric = Tenant.create(name: "Ric Flair", age: 98, gender: "male", apartment_id: 21)
rowdy = Tenant.create(name: "Roddy Piper", age: 97, gender: "male", apartment_id: 21)
hogan = Tenant.create(name: "Hulk Hogan", age: 96, gender: "male", apartment_id: 22)
macho = Tenant.create(name: "Randy Savage", age: 95, gender: "male", apartment_id: 22)
perfect = Tenant.create(name: "Mr. Perfect", age: 40, gender: "male", apartment_id: 22)
heenan = Tenant.create(name: "Bobby Heenan", age: 69, gender: "male", apartment_id: 23)
monsoon = Tenant.create(name: "Gorilla Monsoon", age: 87, gender: "male", apartment_id: 23)
vince = Tenant.create(name: "Vince McMahon", age: 99, gender: "male", apartment_id: 23)
