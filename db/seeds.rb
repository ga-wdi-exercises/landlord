require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'

require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apt1 = Apartment.create(address:'539 Florida Ave', monthly_rent: 2000, sqft: 654, num_beds: 1, num_baths:1)
apt2 = Apartment.create(address:'533 Rhode Island Ave', monthly_rent: 5435, sqft: 2764, num_beds: 4, num_baths:3)
apt3 = Apartment.create(address:'532 Georgia Ave', monthly_rent: 1860, sqft: 434, num_beds: 1, num_baths:1)

tenant1 = Tenant.create(name:"Don Draper", age:45, gender:"Male")
tenant2 = Tenant.create(name:"Betty Draper", age:45, gender:"Female")
tenant3 = Tenant.create(name:"Peggy Olson", age:25, gender:"Female")
tenant4 = Tenant.create(name:"Pete Campbell", age:32, gender:"Male")
tenant5 = Tenant.create(name:"Roger Sterling", age:60, gender:"Male")
tenant6 = Tenant.create(name:"Joan Halloway", age:40, gender:"Female")
tenant7 = Tenant.create(name:"Harry Crane", age:40, gender:"Male")
tenant8 = Tenant.create(name:"Lane Pryce", age:50, gender:"Male")
tenant9 = Tenant.create(name:"Sally Draper", age:12, gender:"Female")

apt2.tenants = [tenant1, tenant2, tenant3, tenant4, tenant5]

alltenants = Tenant.all

apt2tenants = apt2.tenants

apt3.update(address: "4849 Connecticut Ave")

apt2.destroy
binding.pry
