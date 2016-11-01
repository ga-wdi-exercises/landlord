require "active_record" # the ORM

require_relative "../models/apartment"
require_relative "../models/tenant"
require_relative "connection"


Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "10217 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
Apartment.create(address: "10218 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
Apartment.create(address: "10219 Windsor View Drive", monthly_rent: 3000, sqft: 450, num_beds: 4, num_baths: 3);
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Jon", age: 27, gender: "male", apartment_id: 1);
Tenant.create(name: "Jon2", age: 27, gender: "male", apartment_id: 1);
Tenant.create(name: "Jon3", age: 27, gender: "male", apartment_id: 1);
Tenant.create(name: "Jon4", age: 27, gender: "male", apartment_id: 2);
Tenant.create(name: "Jon5", age: 27, gender: "male", apartment_id: 2);
Tenant.create(name: "Jon6", age: 27, gender: "male", apartment_id: 2);
Tenant.create(name: "Jon7", age: 27, gender: "male", apartment_id: 3);
Tenant.create(name: "Jon8", age: 27, gender: "male", apartment_id: 3);
Tenant.create(name: "Jon9", age: 27, gender: "male", apartment_id: 3);
