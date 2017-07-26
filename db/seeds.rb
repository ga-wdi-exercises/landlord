require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

fun_house1 = Apartment.create(address: "123 Fake St", monthly_rent: 2000, sqft: 1000, num_beds: 2, num_baths: 2)

fun_house2 = Apartment.create(address: "321 Fake St", monthly_rent: 3000, sqft: 1, num_beds: 1, num_baths: 2)

fun_house3 = Apartment.create(address: "666 Fake St", monthly_rent: 4000, sqft: 2, num_beds: 2, num_baths: 200)

ten1 = Tenant.create(name: "Sally", age: 42, gender: "female", apartment: fun_house1)
ten2 = Tenant.create(name: "Marty", age: 30, gender: "male", apartment: fun_house2)
ten3 = Tenant.create(name: "Egbert", age: 100, gender: "female", apartment: fun_house3)
ten4 = Tenant.create(name: "Bertha", age: 200, gender: "male", apartment: fun_house1)
ten5 = Tenant.create(name: "Dilly", age: 69, gender: "female", apartment: fun_house2)
ten6 = Tenant.create(name: "Derpy", age: 24, gender: "male", apartment: fun_house3)
ten7 = Tenant.create(name: "WakaWaka", age: 2, gender: "female", apartment: fun_house1)
ten8 = Tenant.create(name: "Sloopy", age: 55, gender: "male", apartment: fun_house1)
ten9 = Tenant.create(name: "Sloppy", age: 76, gender: "female", apartment: fun_house2)
