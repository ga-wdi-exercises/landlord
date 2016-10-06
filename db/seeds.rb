require 'active_record'
# require 'ffaker'
require 'pg'
require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all


Apartment.create(address:"123 Grand Street", monthly_rent: 3000, sqft:1000, num_beds: 2, num_baths: 2)
Apartment.create(address:"88 Park Ave", monthly_rent:1500, sqft: 800, num_beds:2,num_baths:1)
Apartment.create(address:"456 Madison Ave", monthly_rent: 2000, sqft: 1200, num_beds:1, num_baths: 1)

Tenant.create(name:"Jane Jones", age: 40, gender:"Female", apartment_id: 1)
Tenant.create(name:"Sam Samuel", age: 25, gender:"Male", apartment_id: 1)
Tenant.create(name:"Kim Kardan", age: 31, gender:"Female", apartment_id: 1)
Tenant.create(name:"Lucas Chaplin", age:18, gender:"Male", apartment_id: 2)
Tenant.create(name:"Brad Cormier", age: 45, gender:"Male", apartment_id: 2)
Tenant.create(name:"Melinda King", age: 31, gender:"Female", apartment_id: 2)
Tenant.create(name:"Jesse King", age: 10, gender:"Male", apartment_id: 2)
Tenant.create(name:"Ryan Kartz", age: 67, gender:"Male", apartment_id: 2)
Tenant.create(name:"Raymond Kim", age: 35, gender:"Male", apartment_id: 3)
Tenant.create(name:"Susie Kim", age: 34, gender:"Female", apartment_id: 3)
