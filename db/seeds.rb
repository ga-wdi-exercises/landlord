require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all

jetta = Tenant.create("Jetta Murphy", 34, "Male", 1)
henry = Tenant.create("Henry Smith", 70, "Male", 1)
mary = Tenant.create("Mary Johnson", 43, "Female", 2)
larry = Tenant.create("Larry Johnson", 39, "Male", 2)
sam = Tenant.create("Sam Smith", 20, "Female", 3)
bella = Tenant.create("Bella Diaz", 25, "Female", 3)
neil = Tenant.create("Neil Schwab", 50, "Female", 4)
jaz = Tenant.create("Jaz Jazzy", 30, "Male", 4)
cam = Tenant.create("Cam Newton", 34, "Female", 5)

apartment_one = Apartment.create(address: "514 university dr", monthly_rent: 550, sqft: 400, num_beds: 1, num_baths: 1)
apartment_two = Apartment.create(address: "1400 O St", monthly_rent: 850, sqft: 800, num_beds: 2, num_baths: 2)
apartment_three = Apartment.create(address: "613 U St", monthly_rent: 700, sqft: 650, num_beds: 2, num_baths: 1)
