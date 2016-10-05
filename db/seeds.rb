require 'active_record'
require 'pg'
require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all #9
Apartment.create(address: "1260 Millerwood Dr", monthly_rent: 1400, sqft: 1300, num_beds: 4, num_baths: 4)
Apartment.create(address: "10 Frankfurt Rd", monthly_rent: 800, sqft: 300, num_beds: 2, num_baths: 3)
Apartment.create(address: "432 Assembly Ct", monthly_rent: 1600, sqft: 1000, num_beds: 6, num_baths: 2)

Tenant.destroy_all
Tenant.create(name: "Trini Power", age: 32, gender: "Female", apartment_id: 4)
Tenant.create(name: "Kimberly Power", age: 28, gender: "Female", apartment_id: 4)
Tenant.create(name: "Zack Power", age: 30, gender: "Male", apartment_id: 4)
Tenant.create(name: "Jason Power", age: 33, gender: "Male", apartment_id: 4)
Tenant.create(name: "Billy Power", age: 37, gender: "Male", apartment_id: 4)
Tenant.create(name: "Rafael Power", age: 13, gender: "Male", apartment_id: 10)
Tenant.create(name: "Leonardo Power", age: 12, gender: "Male", apartment_id: 2)
Tenant.create(name: "Michaelangelo Power", age: 14, gender: "Male", apartment_id: 1)
Tenant.create(name: "Donatello Power", age: 15, gender: "Male", apartment_id: 5)
