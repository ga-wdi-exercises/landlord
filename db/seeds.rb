require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

mansion = Apartment.create(address: "403 Mansion Lake", monthly_rent: 12000, sqft: 7300, num_beds: 10, num_baths: 16)
sesame = Apartment.create(address: "22 Sesame Street", monthly_rent: 480, sqft: 890, num_beds: 3, num_baths: 2)
gingerbread = Apartment.create(address: "851 Gingerbread Lane", monthly_rent: 970, sqft: 1450, num_beds: 4, num_baths: 4)

Tenant.create(name: "Elmo", age: 29, gender: "Male", apartment_id: mansion.id)
Tenant.create(name: "Cookie Monster", age: 15, gender: "Male", apartment_id: mansion.id)
Tenant.create(name: "Gingerbread Man", age: 49, gender: "Male", apartment_id: sesame.id)
Tenant.create(name: "Mary Poppins", age: 30, gender: "Female", apartment_id: gingerbread.id)
Tenant.create(name: "Will Hawkins", age: 25, gender: "Male", apartment_id: sesame.id)
Tenant.create(name: "Isaac Duarte", age: 24, gender: "Male", apartment_id: mansion.id)
Tenant.create(name: "Spiderman", age: 50, gender: "Male", apartment_id: gingerbread.id)
Tenant.create(name: "Silly Sally", age: 19, gender: "Female", apartment_id: sesame.id)
Tenant.create(name: "Priscilla Bean", age: 42, gender: "Female", apartment_id: mansion.id)
Tenant.create(name: "Willy Wonka", age: 55, gender: "Male", apartment_id: gingerbread.id)
