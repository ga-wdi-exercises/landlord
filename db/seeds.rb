require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

Tenant.destroy_all
Apartment.destroy_all

Apartment.create ([
  {address: "2536 Rainbow Lane", monthly_rent: 600, sqft: 920, num_beds: 0, num_baths: 1},
  {address: "7720 Trout Run", monthly_rent: 820, sqft: 1020, num_beds: 1, num_baths: 1},
  {address: "2430 Peake Road", monthly_rent: 1100, sqft: 2000, num_beds: 2, num_baths: 2}
])

Tenant.create ([
  {name: "Sheila Jones", age: 23, gender: "female", apartment_id: 4},
  {name: "Liz Girma", age: 36, gender: "female", apartment_id: 4},
  {name: "Sam Qureshi", age: 30, gender: "males", apartment_id: 17},
  {name: "Olivia Bergen", age: 22, gender: "female", apartment_id: 13},
  {name: "Matt Shields", age: 27, gender: "male", apartment_id: 13},
  {name: "Zoe Isakoff", age: 32, gender: "female", apartment_id: 17},
  {name: "Rajesh Prasad", age: 25, gender: "male", apartment_id: 13},
  {name: "Radha Mahadevan", age: 29, gender: "female", apartment_id: 17},
  {name: "James Jacobs", age: 32, gender: "male", apartment_id: 4},
  {name: "Mary Quesada", age: 29, gender: "female", apartment_id: 17}
])
