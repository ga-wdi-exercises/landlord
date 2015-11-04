require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apt1 = Apartment.create(address: '70335 Clemenargaertine Tunnel', monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths: 2)

apt2 = Apartment.create(address: '44010 Lemke Crossroad', monthly_rent: 1000, sqft: 1300, num_beds: 1, num_baths: 3)

apt3 = Apartment.create(address: '77841 Jany Lane', monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths: 3)
