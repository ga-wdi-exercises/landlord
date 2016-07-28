require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

apt1 = Apartment.create(address: "1234 Miss Cleo Ln",  monthly_rent: 1200, sqft: 750, num_beds: 1, num_baths: 1)
apt2 = Apartment.create(address: "555 Brady Ct",  monthly_rent: 1600, sqft: 800, num_beds: 2, num_baths: 1)
apt3 = Apartment.create(address: "9487 Blue Pl",  monthly_rent: 1900, sqft: 900, num_beds: 3, num_baths: 2)

jay = Tenant.create(name: "Jay", age: 15, gender: "male", apartment_id: 1)
zay = Tenant.create(name: "Zay", age: 20, gender: "male", apartment_id: 1)
bay = Tenant.create(name: "Bay", age: 25, gender: "male", apartment_id: 1)
ray = Tenant.create(name: "Ray", age: 30, gender: "male", apartment_id: 1)
tay = Tenant.create(name: "Tay", age: 35, gender: "female", apartment_id: 2)
kay = Tenant.create(name: "Kay", age: 40, gender: "female", apartment_id: 2)
may = Tenant.create(name: "May", age: 45, gender: "female", apartment_id: 3)
day = Tenant.create(name: "Day", age: 50, gender: "male", apartment_id: 2)
lay = Tenant.create(name: "Lay", age: 55, gender: "female", apartment_id: 3)
