require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all


apartment1 = Apartment.create(address: '1601 Argonne Pl NW', monthly_rent: 1925, sqft: 750, num_beds: 1, num_baths: 1)
apartment2 = Apartment.create(address: '1523 22nd St NW', monthly_rent: 2200, sqft: 1000, num_beds: 3, num_baths: 2)
apartment3 = Apartment.create(address: '530 Overbrook Rd', monthly_rent: 1500, sqft: 1200, num_beds: 2, num_baths: 2)

erin = Tenant.create(name: 'Erin Dawson', age: 36, gender: 'Female', apartment_id: 20)
kendelyn = Tenant.create(name: 'Kendelyn Ouellette', age: 24, gender: 'Female', apartment_id: 20)
bryan = Tenant.create(name: 'Bryan Dawson', age: 34, gender: 'Male', apartment_id: 20)
mike = Tenant.create(name: 'Mike Del Rey', age: 36, gender: 'Male', apartment_id: 22)
kate = Tenant.create(name: 'Kate Campagna', age: 29, gender: 'Female', apartment_id: 22)
magan = Tenant.create(name: 'Magan Ruthke', age: 36, gender: 'Female', apartment_id: 22)
jon = Tenant.create(name: 'Jonathan Harris', age: 26, gender: 'Male', apartment_id: 24)
jose = Tenant.create(name: 'Jose Alfaro', age: 35, gender: 'Male', apartment_id: 24)
pete = Tenant.create(name: 'Peter Pruitt', age: 30, gender: 'Male', apartment_id: 24)
