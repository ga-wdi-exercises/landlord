require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "models/artist"
require_relative "models/song"

Apartment.destroy_all;
Tenant.destroy_all;

# create 3 apartments
apt1 = Apartment.create(address: "2729 Gallows Rd, 22180", monthly_rent: 2100, sqft: 1500, num_beds: 2, num_baths: 2, renters: "no one");
apt2 = Apartment.create(address: "1229 Gallows Rd, 22180", monthly_rent: 1900, sqft: 1000, num_beds: 3, num_baths: 2, renters: "no one");
apt3 = Apartment.create(address: "5 Gallows Rd, 22180", monthly_rent: 3000, sqft: 2000, num_beds: 4, num_baths: 3, renters: "no one");

# create 9 tenants
Tenant.create(name:"Wonsik", age: 25, gender: "M", apartment_id: 1 );
Tenant.create(name:"Chalky", age: 19, gender: "M", apartment_id: 1 );
Tenant.create(name:"Brandon", age: 30, gender: "M", apartment_id: 2 );
Tenant.create(name:"Elise", age: 27, gender: "F", apartment_id: 3 );
Tenant.create(name:"Starr", age: 25, gender: "F", apartment_id: 2 );
Tenant.create(name:"Adrian", age: 29, gender: "M", apartment_id: 1 );
Tenant.create(name:"Robin", age: 26, gender: "M", apartment_id: 2 );
Tenant.create(name:"Erica", age: 23, gender: "M", apartment_id: 3 );

binding.pry;
