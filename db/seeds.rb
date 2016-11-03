require 'active_record'
require 'pg'

require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: "23 Old st.", monthly_rent: 2000, sqft: 1800, num_beds: 3, num_baths: 2)
Apartment.create(address: "100 New Rd.", monthly_rent: 2600, sqft: 800, num_beds: 2, num_baths: 1)
young_ave = Apartment.create(address: "65 Young Ave.", monthly_rent: 1000, sqft: 1200, num_beds: 3, num_baths: 2)

Tenant.create(name:'Sue Jacobs',age: 18, gender: 'Female', apartment_id: 1)
Tenant.create(name:'Steve Martin',age: 45, gender: 'Male', apartment_id: 2)
Tenant.create(name:'Bob Marks', age: 78, gender: 'Male',apartment_id: 3)
Tenant.create(name: 'Marta Roses',age: 24,gender: 'Female', apartment_id: 1)
Tenant.create(name: 'April Summers',age: 35, gender: 'Female', apartment_id: 2)
Tenant.create(name: 'leo Summers',age: 25, gender: 'Male', apartment_id:2)
Tenant.create(name: 'van cookie',age: 87, gender: 'Male', apartment_id: 1)
Tenant.create(name: 'Josie Kin',age: 25, gender: 'Female', apartment_id: 3)
Tenant.create(name: 'Tom lucas',age: 40, gender: 'Male', apartment_id: 3)
