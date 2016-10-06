require_relative 'connection'

# models
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create address: '1600 Pennsylvania Ave', monthly_rent: 1800000, sqft: 54900, num_beds: 35, num_baths: 35
apt2 = Apartment.create address: '6004 W Grove Cir', monthly_rent: 2000, sqft: 3000, num_beds: 4, num_baths: 4
apt3 = Apartment.create address: '1416 112th Ave', monthly_rent: 1200, sqft: 2100, num_beds: 3, num_baths: 2

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

ten1 = Tenant.create name: 'Tim', age: 26, apartment_id: 1
ten2 = Tenant.create name: 'Nick', age: 25, apartment_id: 2
ten3 = Tenant.create name: 'Alex', age: 24, apartment_id: 2
ten4 = Tenant.create name: 'Barret', age: 29, apartment_id: 2
ten5 = Tenant.create name: 'Jesse', age: 44, apartment_id: 2
ten6 = Tenant.create name: 'Liza', age: 28, apartment_id: 3
ten7 = Tenant.create name: 'Mike', age: 30, apartment_id: 3
ten8 = Tenant.create name: 'Adrian', age: 29, apartment_id: 3
ten9 = Tenant.create name: 'Kevin', age: 24, apartment_id: 3
