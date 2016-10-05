require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"


Tenant.destroy_all
Apartment.destroy_all

Apartment.create(address: '1233 Brandywine Ln', monthly_rent: 900, sqft: 1200, num_beds: 3, num_baths: 5)
Apartment.create(address: '1160 First Street', monthly_rent: 1200, sqft: 1800, num_beds: 2, num_baths: 3)
Apartment.create(address: '1820 Jackson Street', monthly_rent: 850, sqft: 1000, num_beds: 3, num_baths: 4)

Tenant.create(name: 'Andrew Whitley', age: 24, gender: 'male', apartment_id: 1)
Tenant.create(name: 'Mark Cuban', age: 44, gender: 'male', apartment_id: 1)
Tenant.create(name: 'Mark Zuckerberg', age: 32, gender: 'male', apartment_id: 1)
Tenant.create(name: 'Julio Jones', age: 28, gender: 'male', apartment_id: 2)
Tenant.create(name: 'Nick Saban', age: 62, gender: 'male', apartment_id: 2)
Tenant.create(name: 'Marcus Calpakis', age: 25, gender: 'male', apartment_id: 2)
Tenant.create(name: 'Merrian Webster', age: 99, gender: 'male', apartment_id: 3)
Tenant.create(name: 'Samuel Adams', age: 99, gender: 'male', apartment_id: 3)
Tenant.create(name: 'Barrack Obama', age: 58, gender: 'male', apartment_id: 3)
