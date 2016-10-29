require_relative "connection.rb"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

apartment_one = Apartment.create(id: 97,address: "black" ,monthly_rent: 999,sqft: 1 ,num_beds: 10,num_baths: 10)
apartment_two = Apartment.create(id: 98,address: "black" ,monthly_rent: 999,sqft: 1 ,num_beds: 10,num_baths: 10)
apartment_three = Apartment.create(id: 99,address:"black" ,monthly_rent: 999,sqft: 1 ,num_beds: 10,num_baths: 10)

tenant_one = Tenant.create(id: 100, name: "bradley", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_two = Tenant.create(id: 101, name: "brad", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_three = Tenant.create(id: 102, name: "b rad", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_four = Tenant.create(id: 103, name: "bradster", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_five = Tenant.create(id: 104, name: "b", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_six = Tenant.create(id: 105, name: "brah", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_seven = Tenant.create(id: 106, name: "bro", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_eight = Tenant.create(id: 107, name: "bra", age: 22, gender: "Rather not say", apartment_id: 1)
tenant_nine = Tenant.create(id: 108, name: "bradlee", age: 22, gender: "Rather not say", apartment_id: 1)
