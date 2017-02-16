
require 'pg'

require 'active_record'

# require 'ffaker'

require_relative 'connection'

require_relative '../models/apartment'

require_relative '../models/tenant'


Tenant.destroy_all
Apartment.destroy_all

Tenant.create ([
{name: "Ian Clark", age: 21, gender: "Male"},
{name: "Steph Curry", age: 30, gender: "Male"},
{name: "Kevin Durant", age: 35, gender: "Male"},
{name: "Draymond Green", age: 23, gender: "Male"},
{name: "Andre Inguadola", age: 9, gender:"Male"}
{name: "Klay Thompson", age: 11, gender: "Male"},
{name: "Javale Mcghee", age: 34, gender: "Male"},
{name: "Sean Livingston", age: 34, gender: "Male"},
{name: "Lebron James", age: 23, gender:"Male"};
])
Apartment.create(address: "103 Hawthorne ct ne", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
Apartment.create(address: "1285 Village Ave", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
Apartment.create(address: "100 michigan ave", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)
