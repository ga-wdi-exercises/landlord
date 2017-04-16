require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: '123 Maple Lane', monthly_rent: 700, sqft: 900, num_beds: 1, num_baths: 1)
Apartment.create(address: '456 Cedar Lane', monthly_rent: 1200, sqft: 1500, num_beds: 2, num_baths: 2)
Apartment.create(address: '789 Oak Rd', monthly_rent: 2000, sqft:2000, num_beds: 3, num_baths: 2)
#I'm hardcoding the apartment_id's to match what the aparmnt id's will be, but should figure out way to make that dynamic?
Tenant.create(name: 'Carolyn Chan', age: 22, gender: 'Female', apartment_id: 36)
Tenant.create(name: 'Paige Blundt', age: 29, gender: 'Female', apartment_id: 37)
Tenant.create(name: 'Mark Jaboar', age: 23, gender: 'Male', apartment_id: 37)
Tenant.create(name: 'Natalia Jaboar', age: 23, gender: 'Female', apartment_id: 37)
Tenant.create(name: 'Arthur Weasley', age: 55, gender: 'Male', apartment_id: 38)
Tenant.create(name: 'Molly Weasley', age: 53, gender: 'Female', apartment_id: 38)
Tenant.create(name: 'Fred Weasley', age: 20, gender: 'Male', apartment_id: 38)
Tenant.create(name: 'George Weasley', age: 20, gender: 'Male', apartment_id: 38)
Tenant.create(name: 'Ron Weasley', age: 15, gender: 'Male', apartment_id: 38)

binding.pry