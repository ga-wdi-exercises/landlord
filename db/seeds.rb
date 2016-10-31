require 'active_record'
require_relative "connection"

require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

apartment_one = Apartment.create(id: 1,address: "12312 Yellow brick road" ,monthly_rent: 599,sqft: 1550 ,num_beds: 5,num_baths: 1)
apartment_two = Apartment.create(id: 2,address: "343 White house" ,monthly_rent: 959,sqft: 2100 ,num_beds: 10,num_baths: 4)
apartment_three = Apartment.create(id: 3,address:"5766 Orange court" ,monthly_rent: 1201,sqft: 895 ,num_beds: 3,num_baths: 5)

tenant_one = Tenant.create(id: 100, name: "bradley", age: 57, gender: "Male", apartment_id: 1)
tenant_two = Tenant.create(id: 101, name: "Paul", age: 28, gender: "Rather not say", apartment_id: 1)
tenant_three = Tenant.create(id: 102, name: "Tom", age: 13, gender: "Male", apartment_id: 1)
tenant_four = Tenant.create(id: 103, name: "Kim", age: 59, gender: "Female", apartment_id: 2)
tenant_five = Tenant.create(id: 104, name: "Jolie", age: 72, gender: "Female", apartment_id: 2)
tenant_six = Tenant.create(id: 105, name: "Ethan", age: 42, gender: "Male", apartment_id: 3)
tenant_seven = Tenant.create(id: 106, name: "Elizabeth", age: 92, gender: "Female", apartment_id: 3)
tenant_eight = Tenant.create(id: 107, name: "Mike", age: 32, gender: "Male", apartment_id: 3)
tenant_nine = Tenant.create(id: 108, name: "Kathy", age: 25, gender: "Female", apartment_id: 3)
