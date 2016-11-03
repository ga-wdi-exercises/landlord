require "active_record" # the ORM

require_relative "../models/apartment"
require_relative "../models/tenant"
require_relative "connection"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address:"6910 green drive", monthly_rent: 2900, sqft: 600, num_beds: 2,num_bath:1)
Apartment.create(address:"1900 red drive", monthly_rent: 3100, sqft: 600, num_beds: 1,num_bath:2)
Apartment.create(address:"1100 blue drive", monthly_rent: 2999, sqft: 600, num_beds: 2,num_bath:1)

Tenant.create(name: "Bob", age: 25, gender: "male", apartment_id: 1);
Tenant.create(name: "James", age: 25, gender: "male", apartment_id: 2);
Tenant.create(name: "Clint", age: 27, gender: "male", apartment_id: 3);
Tenant.create(name: "Amy", age: 17, gender: "female", apartment_id: 1);
Tenant.create(name: "Cindy", age: 27, gender: "female", apartment_id: 2);
Tenant.create(name: "Bill", age: 22, gender: "male", apartment_id: 3);
Tenant.create(name: "Diana", age: 25, gender: "female", apartment_id: 1);
Tenant.create(name: "Forrest", age: 26, gender: "male", apartment_id: 2);
Tenant.create(name: "Blob", age: 20, gender: "male", apartment_id: 3);
