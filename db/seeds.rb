require 'active_record'
require 'pg'

require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apartment1 = Apartment.create(address: "123 Fake Street", monthly_rent: 1000, sqft: 1000, num_beds: 3, num_baths: 4)
apartment2 = Apartment.create(address: "345 Imagination Street", monthly_rent: 2000, sqft: 5000, num_beds: 2, num_baths: 1)
apartment3 = Apartment.create(address: "567 Ugly Street", monthly_rent: 500, sqft: 700, num_beds: 2, num_baths: 1)

tenant1 = Tenant.create(name: "Charlotte", age: 11, gender: "female", apartment_id: 1)
tenant2 = Tenant.create(name: "Charley", age: 21, gender: "male", apartment_id: 15)
tenant3 = Tenant.create(name: "Pam", age: 18, gender: "female", apartment_id: 1)
tenant4 = Tenant.create(name: "Sam", age: 41, gender: "male", apartment_id: 6)
tenant5 = Tenant.create(name: "Tim", age: 34, gender: "female", apartment_id: 10)
tenant6 = Tenant.create(name: "Kim", age: 25, gender: "male", apartment_id: 4)
tenant7 = Tenant.create(name: "Sim", age: 66, gender: "female", apartment_id: 17)
tenant8 = Tenant.create(name: "Lim", age: 78, gender: "male", apartment_id: 2)
tenant9 = Tenant.create(name: "Chris", age: 146, gender: "female", apartment_id: 18)
