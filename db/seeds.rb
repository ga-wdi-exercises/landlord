require_relative "connection.rb"
require_relative "../models/apartment.rb"
require_relative "../models/tenant.rb"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "4128 Baldwin Crescent", monthly_rent: 7500, sqft: 2000, num_beds: 3, num_baths: 2.5)
Apartment.create(address: "4055 Joshua Barney", monthly_rent: 5000, sqft: 1500, num_beds: 2, num_baths: 2)
Apartment.create(address: "1211 Abraham Drive", monthly_rent: 10000, sqft: 3500, num_beds: 5, num_baths: 4)

Tenant.create(name: "Alexander	Hardy", age: "25", gender: "Male", apartment_id: 7)
Tenant.create(name: "Sonia Bowen", age: "42", gender: "Female", apartment_id: 14)
Tenant.create(name: "Raymond	Adams", age: "28", gender: "Male", apartment_id: 5)
Tenant.create(name: "Tyler	French", age: "34", gender: "Male", apartment_id: 12)
Tenant.create(name: "Carrie	Bryant", age: "29", gender: "Female", apartment_id: 9)
Tenant.create(name: "Allan	Stewart", age: "43", gender: "Male", apartment_id: 19)
Tenant.create(name: "Lynne	Yates", age: "22", gender: "Female", apartment_id: 9)
Tenant.create(name: "Kelly	Grant", age: "41", gender: "Female", apartment_id: 17)
Tenant.create(name: "Ricardo	Benson", age: "36", gender: "Male", apartment_id: 10)
Tenant.create(name: "Valerie	Conner", age: "27", gender: "Female", apartment_id: 11)
