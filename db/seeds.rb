require 'active_record'

require_relative 'connection'

require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "699 Hawthorne Avenue", monthly_rent: 6500, sqft: 4000, num_beds: 10, num_baths: 10)
Apartment.create(address: "1212 Jefferson Davis HW", monthly_rent: 3000, sqft: 2500, num_beds: 3, num_baths: 2)
Apartment.create(address: "36 Winter St", monthly_rent: 1000, sqft: 2000, num_beds: 3, num_baths: 2)

Tenant.create(name: "Jill Withers", age: 22, gender: "Female", apartment_id: 2)
Tenant.create(name: "Max Withers", age: 24, gender: "Male", apartment_id: 2)
Tenant.create(name: "Eli Larkey", age: 39, gender: "Male", apartment_id: 1)
Tenant.create(name: "Kevin Daniels", age: 32, gender: "Male", apartment_id: 1)
Tenant.create(name: "Pamela Noris", age: 28, gender: "Female", apartment_id: 1)
Tenant.create(name: "Edith Martin", age: 27, gender: "Female", apartment_id: 1)
Tenant.create(name: "Jim Matthews", age: 30, gender: "Male", apartment_id: 1)
Tenant.create(name: "Laurie Connors", age: 35, gender: "Female", apartment_id: 1)
Tenant.create(name: "Amy Ellis", age: 22, gender: "Female", apartment_id: 3)
