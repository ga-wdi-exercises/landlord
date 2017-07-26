require 'active_record'
require_relative 'connection'

require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all


Apartment.create(address: '1401 S Street', monthly_rent: 4000, sqft: 1500, num_beds: 2, num_baths: 2)
Apartment.create(address: '867 Main Street', monthly_rent: 1000, sqft: 500, num_beds: 1, num_baths: 1)
Apartment.create(address: '42 Wallaby Way', monthly_rent: 1500, sqft: 950, num_beds: 2, num_baths: 1)

Tenant.create(name: 'P Sherman', age: '30', gender: 'Male', apartment_id: 74)
Tenant.create(name: 'Nemo', age: '10', gender: 'Male', apartment_id: 74)
Tenant.create(name: 'John Smith', age: '42', gender: 'Male', apartment_id: 72)
Tenant.create(name: 'Whitney Cargill', age: '32', gender: 'Female', apartment_id: 72)
Tenant.create(name: 'Cindy Lou', age: '12', gender: 'Female', apartment_id: 73)
Tenant.create(name: 'Brie Jones', age: '32', gender: 'Female', apartment_id: 73)
Tenant.create(name: 'Mark Appleby', age: '35', gender: 'Male', apartment_id: 3)
Tenant.create(name: 'James Johnson', age: '40', gender: 'Male', apartment_id: 1)
Tenant.create(name: 'Wendy Bite', age: '80', gender: 'Female', apartment_id: 1)
