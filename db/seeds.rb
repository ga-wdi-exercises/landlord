require 'active_record'
# require 'ffaker'
require 'pg'
require_relative 'connection'
require_relative '../models/tenant'
require_relative '../models/apartment'



Tenant.destroy_all
Apartment.destroy_all


x1 = Apartment.create(address: '123 moon st ', monthly_rent: 800, sqft: 1900,num_beds: 3,num_baths: 3)
x1 = Apartment.create(address: '456 mars st ', monthly_rent: 700, sqft: 1900,num_beds: 2,num_baths: 2)
x1 = Apartment.create(address: '789 pluto st ', monthly_rent: 600, sqft: 1900,num_beds: 1,num_baths: 1)


t1 = Tenant.create(name: guy1, age: 20, gender: "female", apartment_id: 10)
t2 = Tenant.create(name: guy2, age: 20, gender: "female", apartment_id: 10)
t3 = Tenant.create(name: guy3, age: 20, gender: "female", apartment_id: 10)
t4 = Tenant.create(name: guy4, age: 20, gender: "female", apartment_id: 10)
t5 = Tenant.create(name: guy5, age: 20, gender: "female", apartment_id: 10)
t6 = Tenant.create(name: guy6, age: 20, gender: "female", apartment_id: 10)
t7 = Tenant.create(name: guy7, age: 20, gender: "female", apartment_id: 10)
t8 = Tenant.create(name: guy8, age: 20, gender: "female", apartment_id: 10)
t9 = Tenant.create(name: guy9, age: 20, gender: "female", apartment_id: 10)
