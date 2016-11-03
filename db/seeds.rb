require_relative 'connection'

require_relative '../models/apartment'
require_relative '../models/tenant'
Tenant.destroy_all
Apartment.destroy_all

this = Apartment.create(:address =>"1234 this lane", :monthly_rent => 700, :sqft => 1400, :num_beds => 2, :num_baths => 1)
that = Apartment.create(:address =>"5678 that lane", :monthly_rent =>700, :sqft => 1400, :num_beds => 2, :num_baths => 1)
cool = Apartment.create(:address =>"420 cool st", :monthly_rent =>666, :sqft => 2100, :num_beds => 3, :num_baths =>2)
a = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment_id: 3)
b = Tenant.create(name: "Dan", age: 31, gender: "Male", apartment_id: 2)
c = Tenant.create(name: "Fran", age: 32, gender: "Male", apartment_id: 3)
d = Tenant.create(name: "Frank", age: 33, gender: "Male", apartment_id: 1)
e = Tenant.create(name: "Francis", age: 34, gender: "Male", apartment_id: 2)
f = Tenant.create(name: "Francine", age: 35, gender: "Female", apartment_id: 2)
g = Tenant.create(name: "Francois", age: 36, gender: "Male", apartment_id: 1)
h = Tenant.create(name: "Frankford", age: 37, gender: "Male", apartment_id: 3)
i = Tenant.create(name: "France", age: 65, gender: "Male", apartment_id: 3)
