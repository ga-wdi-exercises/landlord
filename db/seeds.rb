require "pg"
require "active_record"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

apt1 = Apartment.create(address: "36 Chambers Way", monthly_rent: 800, sqft: 1994, num_beds: 2, num_baths: 2)
apt2 = Apartment.create(address: "1994 Brooklyn Zoo", monthly_rent: 850, sqft: 1998, num_beds: 3, num_baths: 2)
apt3 = Apartment.create(address: "8 Diagrams Plaza", monthly_rent: 900, sqft: 2000, num_beds: 4, num_baths: 3)

tenant1 = Tenant.create(name: "RZA", age:32, gender:"Male", apartment_id:apt1.id)
tenant2 = Tenant.create(name: "GZA", age:34, gender:"Male", apartment_id:apt1.id)
tenant3 = Tenant.create(name: "Ol' Dirty Bastard", age:50, gender:"Male", apartment_id:apt1.id)
tenant4 = Tenant.create(name: "Inspecktah Deck", age:36, gender:"Male", apartment_id:apt2.id)
tenant5 = Tenant.create(name: "Raekwon", age:37, gender:"Male", apartment_id:apt2.id)
tenant6 = Tenant.create(name: "U-God", age:38, gender:"Male", apartment_id:apt2.id)
tenant7 = Tenant.create(name: "Ghostface Killah", age:39, gender:"Male", apartment_id:apt3.id)
tenant8 = Tenant.create(name: "Method Man", age:41, gender:"Male", apartment_id:apt3.id)
tenant9 = Tenant.create(name: "Masta Killa", age:42, gender:"Male", apartment_id:apt3.id)
