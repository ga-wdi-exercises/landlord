require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "107 schoolfield dr", monthly_rent: 0, sqft: 100000, num_beds: 4, num_baths: 3)
Apartment.create(address: "629 Mass Ave", monthly_rent: 1000, sqft: 2389, num_beds: 5, num_baths: 3)
Apartment.create(address: "17 Laurel Hill rd", monthly_rent: 850, sqft: 3400, num_beds: 5, num_baths: 3)

Tenant.create(name: "Sarah", age: 99, gender: "cis",  apartment_id: 2)
Tenant.create(name: "Winston Davis", age: 29, gender: "male",  apartment_id: 3)
Tenant.create(name: "Carmen Garry McCoy", age: 39, gender: "female",  apartment_id: 2)
Tenant.create(name: "Coen William McCoy", age: 6, gender: "male",  apartment_id: 2)
Tenant.create(name: "Cait Harpper", age: 3, gender: "female",  apartment_id: 2)
Tenant.create(name: "Poot Johnson", age: 56, gender: "male",  apartment_id: 1)
Tenant.create(name: "Samuel McFaceFace", age: 86, gender: "male",  apartment_id: 1)
Tenant.create(name: "Kyle Margeson", age: 32, gender: "male",  apartment_id: 1)
Tenant.create(name: "Tim Margeson", age: 12, gender: "male",  apartment_id: 1)
Tenant.create(name: "Beautiful Russian Girl", age: 22, gender: "female",  apartment_id: 2)
Tenant.create(name: "Jess Davis", age: 24, gender: "female",  apartment_id: 2)


