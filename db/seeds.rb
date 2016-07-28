require 'active_record'
require_relative 'connection'

require_relative '../models/tenant'
require_relative '../models/apartment'

Tenant.destroy_all
Apartment.destroy_all


Apartment.create(address: "123 Road Way", monthly_rent: 3000, sqft: 111, num_beds: 1, num_baths: 1)
Apartment.create(address: "444 Another Road", monthly_rent: 111, sqft: 1200, num_beds: 3, num_baths: 2)
Apartment.create(address: "555 Heaven Street", monthly_rent: 400, sqft: 600, num_beds: 1, num_baths: 1)

Tenant.create(name: "Nala Queen", age: 22, gender: "female", apartment_id: 1)
Tenant.create(name: "Simba King", age: 24, gender: "male", apartment_id: 2)
Tenant.create(name: "Mufassa", age: 55, gender: "male", apartment_id: 3)
