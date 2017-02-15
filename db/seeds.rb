require 'active_record'
require 'pg'
require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Apartment.create(address:"123 Easy St", monthly_rent: 1000, sqft: 2000, num_beds:5, num_baths:4)
Apartment.create(address:"321 Hard St", monthly_rent: 1500, sqft:69, num_beds:1, num_baths:5)
Apartment.create(address:"64 Hard Knock Life Ln", monthly_rent: 450, sqft:100, num_beds:0, num_baths:1)

Tenant.destroy_all
Tenant.create(name:"Bob Loblaw", age:45, gender:"Male", apartment_id: 2)
Tenant.create(name:"Tobias Funke", age:40, gender:"Male", apartment_id: 1)
Tenant.create(name:"Lindsay Funke", age:40, gender:"Female", apartment_id: 1)
Tenant.create(name:"GOB", age:42, gender:"Male", apartment_id: 1)
Tenant.create(name:"Michael Bluth", age:40, gender:"Male", apartment_id: 1)
Tenant.create(name:"Maebe Funke", age:16, gender:"Female", apartment_id: 1)
Tenant.create(name:"George Michael Bluth", age:16, gender:"Male", apartment_id: 1)
Tenant.create(name:"Lucille Bluth", age:70, gender:"Female", apartment_id: 3)
Tenant.create(name:"Buster Bluth", age:45, gender:"Male", apartment_id: 3)
