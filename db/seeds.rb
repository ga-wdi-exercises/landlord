require 'active_record'
require_relative 'connection'

# models
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apartment1 = Apartment.create(address: "14313 Wicklow Ln", monthly_rent: 1200, sqft: 234, num_beds: 2, num_baths: 1)
apartment2 = Apartment.create(address: "2444 Highview ln", monthly_rent: 1042, sqft: 253, num_beds: 3, num_baths: 2)
apartment3 = Apartment.create(address: "45212 Hurtton dr", monthly_rent: 1425, sqft: 235, num_beds: 1, num_baths: 1)
apartment4 = Apartment.create(address: "13444 Faker ln", monthly_rent: 1225, sqft: 450, num_beds: 2, num_baths: 1)
apartment5 = Apartment.create(address: "12513 Hilow dr", monthly_rent: 1222, sqft: 324, num_beds: 3, num_baths: 2)


Tenant.create(name: "Tom", age: 21 , gender: 'male', apartment: apartment5)
Tenant.create(name: "Casey", age: 21 , gender: 'female', apartment: apartment4)
Tenant.create(name: "Bob", age: 21 , gender: 'male', apartment: apartment3)
Tenant.create(name: "Tim", age: 21 , gender: 'female', apartment: apartment1)
Tenant.create(name: "Eevee", age: 21 , gender: 'male', apartment: apartment2)

