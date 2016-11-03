require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

three_bed = Apartment.create(address: "2100 Connecticut Ave. NW", monthly_rent: 2896, sqft: 960, num_beds: 3, num_baths: 2)

group_home = Apartment.create(address: "1301 Massachusetts Ave. NW", monthly_rent: 1405, sqft: 2000, num_beds: 4, num_baths: 2)

one_bed = Apartment.create(address: "3821 Porter St. NW", monthly_rent: 2240, sqft: 800, num_beds: 1, num_baths: 1)


Tenant.create(name: "Juliet Berman", age: 27, gender: "Female", apartment_id: one_bed.id)

Tenant.create(name: "Evan Brender", age: 29, gender: "Male", apartment_id: one_bed.id)

Tenant.create(name: "Shoshi Finkelstein", age: 29, gender: "Female", apartment_id: three_bed.id)

Tenant.create(name: "Michael Smith", age: 24, gender: "Male", apartment_id: three_bed.id)

Tenant.create(name: "Sarah Levy", age: 26, gender: "Female", apartment_id: three_bed.id)

Tenant.create(name: "Peter Piper", age: 22, gender: "Male", apartment_id: group_home.id)

Tenant.create(name: "Lisa Lemon", age: 23, gender: "Female", apartment_id: group_home.id)

Tenant.create(name: "David Dwyer", age: 22, gender: "Male", apartment_id: group_home.id)

Tenant.create(name: "Kelly Klarkson", age: 21, gender: "Female", apartment_id: group_home.id)
