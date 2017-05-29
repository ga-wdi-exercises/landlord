require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"


Apartment.destroy_all
Tenant.destroy_all


apartment_one = Apartment.create(address: "123 Koopaland Dr.", monthly_rent: 7000, sqft: 290, num_beds: 3, num_baths: 2)
apartment_two = Apartment.create(address: "345 Peachland St.", monthly_rent: 800, sqft: 500, num_beds: 1, num_baths: 1)
apartment_three = Apartment.create(address: "678 Toadland Ct.", monthly_rent: 1200, sqft: 850, num_beds: 4, num_baths: 4)


Tenant.create([
  {name: "John Rogers", age: 35, gender: "Male", apartment_id: apartment_one},
  {name: "Helen Hershey", age: 48, gender: "Female", apartment_id: apartment_one},
  {name: "Greg Hershey", age: 8, gender: "Male", apartment_id: apartment_one},
  {name: "Josehp Lee", age: 18, gender: "Male", apartment_id: apartment_two},
  {name: "Matt Ng", age: 26, gender: "Male", apartment_id: apartment_two},
  {name: "Jenny Vo", age: 25, gender: "Female", apartment_id: apartment_two},
  {name: "Andrew Rodriguez", age: 5, gender: "Male", apartment_id: apartment_three},
  {name: "Joese Rodriguez", age: 65, gender: "Male", apartment_id: apartment_three},
  {name: "Maria Rodriguez", age: 45, gender: "Female", apartment_id: apartment_three}
  ])
