require 'pg'
require 'active_record'
# require 'ffaker'


require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

Tenant.create(name: "Spartacus", age: 21, gender: "Male", apartment_id: 21)
Tenant.create(name: "Crixus", age: 22, gender: "Male", apartment_id: 21)
Tenant.create(name: "Gannicus", age: 21, gender: "Male", apartment_id: 21)
Tenant.create(name: "Ragner", age: 22, gender: "Male", apartment_id: 22)
Tenant.create(name: "Bjorn", age: 24, gender: "Male", apartment_id: 22)
Tenant.create(name: "Hagertha", age: 26, gender: "Female", apartment_id: 22)
Tenant.create(name: "Aslaug", age: 29, gender: "Female", apartment_id: 22)
Tenant.create(name: "Onomaeus", age: 22, gender: "Male", apartment_id: 21)
Tenant.create(name: "Fiona", age: 21, gender: "Female", apartment_id: 23)
Apartment.create(address: "123 Fear Street", monthly_rent: 1000, sqft: 700, num_beds: 3, num_baths: 2)
Apartment.create(address: "1833 Dawsons Creek", monthly_rent: 1000, sqft: 700, num_beds: 3, num_baths: 2)
Apartment.create(address: "1736 10th Avenue", monthly_rent: 1000, sqft: 700, num_beds: 3, num_baths: 2)
