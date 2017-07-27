require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

require 'pg'
require 'pry'
require 'active_record'

Tenant.destroy_all
Apartment.destroy_all


  Apartment.create(address: '5150 Left Field Way', monthly_rent: 1200, sqft: 1800, num_beds: 4, num_baths: 3 )
  Apartment.create(address: '3198 Tenley Street', monthly_rent: 1800, sqft: 2200, num_beds: 5, num_baths: 2 )
  Apartment.create(address: '21745 Brink Meadow', monthly_rent: 3200, sqft: 2000, num_beds: 5, num_baths: 3 )


  Tenant.create(name: "John McJohnson", age: 22, gender: 'Male', apartment_id: 1)
  Tenant.create(name: "Bob Roberts", age: 26, gender: 'Male', apartment_id: 1)
  Tenant.create(name: "Sue Susan", age: 29, gender: 'Female', apartment_id: 2)
  Tenant.create(name: "Henry Holiday", age: 32, gender: 'Male', apartment_id: 2)
  Tenant.create(name: "Griff McRiff", age: 42, gender: 'Male', apartment_id: 2)
  Tenant.create(name: "Lisa Lane", age: 28, gender: 'Female', apartment_id: 3)
  Tenant.create(name: "Meg Montana", age: 30, gender: 'Female', apartment_id: 3)
  Tenant.create(name: "Henry Sticks", age: 19, gender: 'Male', apartment_id: 3)
  Tenant.create(name: "Fred Larango", age: 41, gender: 'Male', apartment_id: 3)
