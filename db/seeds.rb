require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all


the_bat_cave = Apartment.create(address: "123 Main St", monthly_rent: 2000, sqft: 600, num_beds: 2, num_baths: 1)
the_sinatra = Apartment.create(address: "1094 Bergen St", monthly_rent: 1800, sqft: 700, num_beds: 2, num_baths: 1)
the_wu_tang = Apartment.create(address: "2970 Flatbush Ave", monthly_rent: 1100, sqft: 650, num_beds: 1.5, num_baths: 1)
the_jeter = Apartment.create(address: "825 Fulton St", monthly_rent: 1300, sqft: 480, num_beds: 1, num_baths: 1)

margaret = Tenant.create(name: "Margaret", age: 24, gender: "Female", apartment_id: 22)
adam = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment_id: 24)
benedict = Tenant.create(name: "Benedict", age: 85, gender: "Male", apartment_id: 22)
georgia = Tenant.create(name: "Georgia", age: 49, gender: "Female", apartment_id: 24)
olu = Tenant.create(name: "Olu", age: 28, gender: "Male", apartment_id: 24)
benson = Tenant.create(name: "Benson", age: 41, gender: "Male", apartment_id: 23)
shukura = Tenant.create(name: "Shukura", age: 29, gender: "Female", apartment_id: 22)
ross = Tenant.create(name: "Ross", age: 28, gender: "Male", apartment_id: 23)
cassandra = Tenant.create(name: "Cassandra", age: 26, gender: "Female", apartment_id: 23)
