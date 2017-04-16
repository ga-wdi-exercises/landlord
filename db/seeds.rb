require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "new address1", monthly_rent: "2000", sqft: "700", num_beds: "3", num_baths: "2")
Apartment.create(address: "new address2", monthly_rent: "200", sqft: "1700", num_beds: "3", num_baths: "2")
Apartment.create(address: "new address3", monthly_rent: "4200", sqft: "3700", num_beds: "4", num_baths: "3")

Tenant.create(name: "John Smith", age: "20", gender: "Male", apartment_id: "21")
Tenant.create(name: "Sam Herd", age: "40", gender: "Male", apartment_id: "21")
Tenant.create(name: "Angie", age: "30", gender: "Female", apartment_id: "21")
Tenant.create(name: "Paul Kim", age: "50", gender: "male", apartment_id: "22")
Tenant.create(name: "Christina", age: "10", gender: "Female", apartment_id: "22")
Tenant.create(name: "Rose", age: "40", gender: "Female", apartment_id: "22")
Tenant.create(name: "Susie", age: "52", gender: "Female", apartment_id: "20")
Tenant.create(name: "Mark", age: "49", gender: "Male", apartment_id: "20")
Tenant.create(name: "Abe", age: "20", gender: "male", apartment_id: "20")
