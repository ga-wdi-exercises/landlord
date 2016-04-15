require "active_record"
require_relative "../models/apartment"
require_relative "../models/tenant"
require_relative "connection"

Tenant.destroy_all
Apartment.destroy_all

new_apartment1 = Apartment.create(address:1000, monthly_rent: 3000, sqft: 1000, num_beds:27, num_baths:2 )
new_apartment2 = Apartment.create(address:1800, monthly_rent:2000, sqft: 1000, num_beds:27, num_baths:2 )
new_apartment3 = Apartment.create(address:1500, monthly_rent:1000, sqft: 600, num_beds:1, num_baths:0 )
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Joe = Tenant.create(name:"Joe", age: 12, gender:"Male", apartment_id:new_apartment1.id)
Tom = Tenant.create(name:"Joe", age: 19, gender:"Male", apartment_id:new_apartment2.id)
Dick = Tenant.create(name:"Joe", age: 19, gender:"Male", apartment_id:new_apartment3.id)
Harry = Tenant.create(name:"Joe", age: 22, gender:"Male", apartment_id:new_apartment3.id)
Suzy = Tenant.create(name:"Joe", age: 23, gender:"Female", apartment_id:new_apartment2.id)
Clyde = Tenant.create(name:"Joe", age: 25, gender:"Male", apartment_id:new_apartment3.id)
Beatrice = Tenant.create(name:"Joe", age: 27, gender:"Female", apartment_id:new_apartment3.id)
Claudette = Tenant.create(name:"Joe", age: 40, gender:"Female", apartment_id:new_apartment1.id)
Carmen = Tenant.create(name:"Joe", age: 30, gender:"Female", apartment_id:new_apartment2.id)
Naomi = Tenant.create(name:"Joe", age: 55, gender:"Female", apartment_id:new_apartment1.id)
