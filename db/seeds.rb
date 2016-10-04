require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Tenant.create(name: "Tim", age: 26, gender: "male", apartment_id: 24)
Tenant.create(name: "Jack", age: 26, gender: "male", apartment_id: 24)
Tenant.create(name: "Joe", age: 26, gender: "male", apartment_id: 26)
Tenant.create(name: "Trey", age: 24, gender: "male", apartment_id: 25)
Tenant.create(name: "Andrew", age: 24, gender: "male", apartment_id: 5)
Tenant.create(name: "Moses", age: 29, gender: "male", apartment_id: 10)
Tenant.create(name: "Jonathan", age: 99, gender: "male", apartment_id: 7)
Tenant.create(name: "Rachel", age: 29, gender: "male", apartment_id: 12)
Tenant.create(name: "Jessica", age: 29, gender: "male", apartment_id: 1)

Apartment.create(address: "2259 12th St NW", monthly_rent: 1760, sqft: 1400, num_beds: 2, num_baths: 1)
Apartment.create(address: "5221 Nebraska Ave NW", monthly_rent: 3600, sqft: 2400, num_beds: 4, num_baths: 2)
Apartment.create(address: "646 Orleans Pl NE", monthly_rent: 1800, sqft: 1300, num_beds: 2, num_baths: 1)
