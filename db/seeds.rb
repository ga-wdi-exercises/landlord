
require "active_record" # the ORM
require_relative "connection"

require_relative "../models/apartment"
require_relative "../models/tenant"


Tenant.destroy_all
Apartment.destroy_all

new_apt1 = Apartment.create(address: "123 Fake Street", monthly_rent: 999, sqft: 400, num_beds: 111, num_baths: 2)
new_apt2 = Apartment.create(address: "124 Fake Street", monthly_rent: 998, sqft: 600, num_beds: 11, num_baths: 2)
new_apt3 = Apartment.create(address: "125 Fake Street", monthly_rent: 997, sqft: 500, num_beds: 15, num_baths: 22)

new_tenant1 = Tenant.create(name: "Ba", age: 99, gender: "male", apartment_id: 1)
new_tenant2 = Tenant.create(name: "Ta", age: 99, gender: "female", apartment_id: 2)
new_tenant3 = Tenant.create(name: "Ra", age: 99, gender: "male", apartment_id: 3)
new_tenant4 = Tenant.create(name: "Na", age: 99, gender: "female", apartment_id: 2)
new_tenant5 = Tenant.create(name: "Pa", age: 99, gender: "male", apartment_id: 3)
new_tenant6 = Tenant.create(name: "Ka", age: 99, gender: "male", apartment_id: 1)
new_tenant7 = Tenant.create(name: "Wa", age: 99, gender: "female", apartment_id: 1)
new_tenant8 = Tenant.create(name: "Qa", age: 99, gender: "male", apartment_id: 2)
new_tenant9 = Tenant.create(name: "Za", age: 99, gender: "male", apartment_id: 3)
