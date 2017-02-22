require_relative:'db/connection'
require_relative:'models/Apartment'
require_relative:'models/Tenant'
Tenant.destroy_all
Apartment.destroy_all
# Create 3 new apartments, and save them to the DB
queenstown = Apartment.create(address: '3227 Chillum Rd', sqft: 930, monthly_rent: 1400, num_beds: 2, num_baths: 1)
brookland_ridge = Apartment.create(address: '400 Taylor St. NE', sqft: 1150, monthly_rent: 1800, num_beds: 2, num_baths: 1)
cypress_creek = Apartment.create(address: '5603 Cypress Creek Dr', sqft: 980, monthly_rent: 1650, num_beds: 2, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
queenstown.tenants.create(name: 'Macey Simone', age: 23, gender: 'female')
queenstown.tenants.create(name: 'Cassidy Browden', age: 23, gender: 'female')
queenstown.tenants.create(name: 'Nashay Washington', age: 29, gender: 'female')
queenstown.tenants.create(name: 'Tenille Middleton', age: 21, gender: 'female')
cypress_creek.tenants.create(name: 'Darrien Joseph', age: 27, gender: 'male')
cypress_creek.tenants.create(name: 'Afia Wilson', age: 25, gender: 'female')
cypress_creek.tenants.create(name: 'Jon-Michael Rosenberg', age: 26, gender: 'male')
brookland_ridge.tenants.create(name: 'Joshua Taborn', age: 28, gender: 'male')
brookland_ridge.tenants.create(name: 'Ashon Henderson', age: 24, gender: 'male')
brookland_ridge.tenants.create(name: 'Tyler Wilson', age: 30, gender: 'male')
