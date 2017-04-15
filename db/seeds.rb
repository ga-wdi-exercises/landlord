require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "/connection.rb"

Tenant.destroy_all
Apartment.destroy_all

#create tenants
Tenant.create([
    {name: "David Brown", age: 30, gender: "male", apartment_id: 4},
    {name: "Whitney Green", age: 80, gender: "female", apartment_id: 8},
    {name: "Sam Orange", age: 45, gender: "male", apartment_id: 9},
    {name: "Elaine Purdum", age: 60, gender: "female", apartment_id: 12},
    {name: "Don Purdum", age: 68, gender: "male", apartment_id: 15},
    {name: "Barrett Purdum", age: 36, gender: "male", apartment_id: 7},
    {name: "Lisa Straus", age: 35, gender: "female", apartment_id: 10},
    {name: "Mike Maher", age: 40, gender: "male", apartment_id: 5},
    {name: "Nancy McWhorter", age: 67, gender: "female", apartment_id: 6},

  ])

  #create Apartments
  Apartment.create([
    {address: "786 Green Hill Road", monthly_rent: 899, sqft: 897, num_beds: 8, num_baths: 8},
    {address: "908 Loop Lane", monthly_rent: 7899, sqft: 897, num_beds: 1, num_baths: 1},
    {address: "456 My Street", monthly_rent: 7890, sqft: 500, num_beds: 6, num_baths: 3},
    ])
