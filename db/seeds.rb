require 'active_record'
require_relative 'connection'

require_relative '../models/tenant'
require_relative '../models/apartment'

Tenant.destroy_all
Apartment.destroy_all


Apartment.create(address: "Cliff", monthly_rent: 30, sqft: 11100, num_beds: 1, num_baths: 1)
Apartment.create(address: "Clouds", monthly_rent: 111, sqft: 1200, num_beds: 3, num_baths: 2)
Apartment.create(address: "Jungle", monthly_rent: 40, sqft: 6000000, num_beds: 1, num_baths: 1)
Apartment.create(address: "Shadow Land", monthly_rent: 0, sqft: 100000, num_beds: 0, num_baths: 0)

Tenant.create(name: "Nala Queen", age: 22, gender: "female", apartment_id: 1)
Tenant.create(name: "Simba King", age: 24, gender: "male", apartment_id: 1)
Tenant.create(name: "Mufassa", age: 55, gender: "male", apartment_id: 2)
Tenant.create(name: "Pumba", age: 68, gender: "male", apartment_id: 3)
Tenant.create(name: "Timone", age: 66, gender: "male", apartment_id: 3)
Tenant.create(name: "Graffiki", age: 1134, gender: "male", apartment_id: 3)
Tenant.create(name: "Hyena Ed", age: 16, gender: "male", apartment_id: 4)
Tenant.create(name: "Scar", age: 59, gender: "male", apartment_id: 4)
Tenant.create(name: "Zazu", age: 169, gender: "male", apartment_id: 1)
