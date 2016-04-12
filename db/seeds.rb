require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

simpsons_house = Apartment.create(address: "742 Evergreen Terrace", monthly_rent: 2400, sqft: 2000, num_beds: 4, num_baths: 2)
flanders_house = Apartment.create(address: "744ish Evergreen Terrace", monthly_rent: 2600, sqft: 2000, num_beds: 4, num_baths: 2)
burns_manor = Apartment.create(address: "1000 Mammon Lane", monthly_rent: 10000, sqft: 12000, num_beds: 10, num_baths: 6)

simpsons_house.tenants.create(name: "Homer Simpson", age: 36, gender: "Male")
simpsons_house.tenants.create(name: "Marge Simpson", age: 34, gender: "Female")
simpsons_house.tenants.create(name: "Bart Simpson", age: 10, gender: "Male")
simpsons_house.tenants.create(name: "Lisa Simpson", age: 8, gender: "Female")
simpsons_house.tenants.create(name: "Maggie Simpson", age: 3, gender: "Female")

flanders_house.tenants.create(name: "Ned Flanders", age: 60, gender: "Male")
flanders_house.tenants.create(name: "Rod Flanders", age: 10, gender: "Male")
flanders_house.tenants.create(name: "Todd Flanders", age: 8, gender: "Male")

burns_manor.tenants.create(name: "Mr. Burns", age: 123, gender: "Male")
