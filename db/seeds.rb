require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

new_apt1 = Apartment.create(address:"601 Calhoun Street", monthly_rent:675, sqft:525, num_beds:1, num_baths:1)
new_apt2 = Apartment.create(address:"1117 Clement Street", monthly_rent:3000, sqft:1100, num_beds:3, num_baths:2)
new_apt3 = Apartment.create(address:"167854 Street Avenue", monthly_rent:1500, sqft:969, num_beds:1, num_baths:2)

new_tenant1 = Tenant.create(name:"Michael Tunt, PhD", age:32, gender:"male", apartment_id:new_apt2.id)
new_tenant2 = Tenant.create(name:"Buster Bluth", age:33, gender:"male", apartment_id:new_apt2.id)
new_tenant3 = Tenant.create(name:"Andrew Lich, Esq.", age:31, gender:"male", apartment_id:new_apt2.id)
new_tenant4 = Tenant.create(name:"Susan Markus", age:54, gender:"female", apartment_id:new_apt1.id)
new_tenant5 = Tenant.create(name:"Bobby Craft", age:27, gender:"male", apartment_id:new_apt2.id)
new_tenant6 = Tenant.create(name:"Lisa Frank", age:59, gender:"female", apartment_id:new_apt3.id)
new_tenant7 = Tenant.create(name:"Kisma Patel, JD", age:38, gender:"female", apartment_id:new_apt3.id)
new_tenant8 = Tenant.create(name:"Ed Harrison", age:19, gender:"male", apartment_id:new_apt2.id)
new_tenant9 = Tenant.create(name:"Brian Bird", age:23, gender:"male", apartment_id:new_apt1.id)
