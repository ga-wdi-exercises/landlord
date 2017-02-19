require_relative "connection.rb"
require_relative "../models/apartment.rb"
require_relative "../models/tenant.rb"

Tenant.destroy_all
Apartment.destroy_all

a = Apartment.create(address: "123 Lollipop Lane", monthly_rent: 3000, sqft: 800, num_beds: 2, num_baths: 2)
b = Apartment.create(address: "4900 Elm Street", monthly_rent: 2100, sqft: 400, num_beds: 1, num_baths: 1)
c = Apartment.create(address: "5 Backwoods Place", monthly_rent: 2000, sqft: 5000, num_beds: 22, num_baths: 4)

Tenant.create(name: "Pookins Magoo", age: 45, gender: "Female", apartment: a)
Tenant.create(name: "Carrot", age: 2, gender: "Female", apartment: b)
Tenant.create(name: "Roderick Lakowski III", age: 67, gender: "Male", apartment: a)
Tenant.create(name: "Taco Truck", age: 91, gender: "Female", apartment: c)
Tenant.create(name: "Derek Langton", age: 22, gender: "Male", apartment: a)
Tenant.create(name: "Falcon Spoonies", age: 58, gender: "Female", apartment: c)
Tenant.create(name: "Bart Ulie", age: 12, gender: "Male", apartment: b)
Tenant.create(name: "Panko Crumm", age: 27, gender: "Female", apartment: a)
Tenant.create(name: "Bleep Bloop", age: 150, gender: "Bleep bloop", apartment: b)
Tenant.create(name: "Pinon Errata", age: 74, gender: "Female", apartment: c)
