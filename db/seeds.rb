require 'active_record'
require_relative 'connection'

require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all


Apartment.create(address: '911 Main Street', monthly_rent: 5000, sqft: 1400, num_beds: 2, num_baths: 22)
Apartment.create(address: '912 Main Street', monthly_rent: 7000, sqft: 1700, num_beds: 2, num_baths: 2)
Apartment.create(address: '913 Main Street', monthly_rent: 6000, sqft: 1900, num_beds: 32, num_baths: 2)

Tenant.create(name: 'Thomas Tank', age: '16', gender: 'Train', apartment_id: 1)
Tenant.create(name: 'Steve Spiel', age: '16', gender: 'Train', apartment_id: 2)
Tenant.create(name: 'Mark Jacobs', age: '16', gender: 'Train', apartment_id: 3)

Tenant.create(name: 'Dolphin Bob', age: '16', gender: 'Train', apartment_id: 1)
Tenant.create(name: 'Henry Rollins', age: '16', gender: 'Train', apartment_id: 2)
Tenant.create(name: 'Manning Pate', age: '16', gender: 'Train', apartment_id: 3)

Tenant.create(name: 'Darth Maul', age: '16', gender: 'Train', apartment_id: 1)
Tenant.create(name: 'Dakota Fanny', age: '16', gender: 'Train', apartment_id: 2)
Tenant.create(name: 'Tib Dibbler', age: '16', gender: 'Train', apartment_id: 3)
