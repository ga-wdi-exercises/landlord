require_relative "connection.rb"
require_relative "../models/apartments"
require_relative "../models/tenants"

Tenant.destroy_all
Apartment.destroy_all


Apartment.create(address: '101 Apple Dr', monthly_rent: 400, sqft: 11000, num_beds: 1, num_baths: 7)

Apartment.create(address: '189 Blueberry Blvd', monthly_rent: 900, sqft: 1000, num_beds: 3, num_baths: 2)

Apartment.create(address: '888 Coconut Ct', monthly_rent: 700, sqft: 7000, num_beds: 1, num_baths: 1)


Tenant.create(name: "Bill", age: 33, gender: 'Male')
Tenant.create(name: "Bob", age: 33, gender: 'Male')
Tenant.create(name: "Parker", age: 32, gender: 'Male')
Tenant.create(name: "John", age: 34, gender: 'Male')
Tenant.create(name: "Gina", age: 30, gender: 'Female')
Tenant.create(name: "Sammmie", age: 18, gender: 'Female')
Tenant.create(name: "Suzie", age: 18, gender: 'Female')
Tenant.create(name: "Bill", age: 33, gender: 'Male')
Tenant.create(name: "Zane", age: 31, gender: 'Male')
