require_relative "Connection"
require_relative "Models/apartment"
require_relative "Models/tenants"
require_relative "db/Connection"
# reqire is saying look for gem and i want to use that.
Tenant destroy_all
Apartment destroy_all

# Create 3 new apartments, and save them to the DB
the_avalon = Apartment.create(address: "181 main street", monthly_rent: 1500, sqft: 1200, num_beds: 2, num_baths: 1)
the_square = Apartment.create(address: "146 main street", monthly_rent: 1700, sqft: 1200, num_beds: 2, num_baths: 2)
the_flowery = Apartment.create(address: "126 main street", monthly_rent: 1850, sqft: 1200, num_beds: 3, num_baths: 2)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
semanta = Tenant.creat(name: "Semanta", age: 32, gender: "Female", apartment_id:
the_avalon)
jij = Tenant.create(name: "Jiji", age: 35, gender: "Female", apartment_id: the_avalon)
daniel = Tenant.create(name: "Daniel", age: 55, gender: "Female", apartment_id: the_avalon)
olga = Tenant.create(name: "Olga", age: 32, gender: "Female", apartment_id: the_square)
megan = Tenant.create(name: "Megan", age: 35, gender: "Female", apartment_id: the_square)
pat = Tenant.create(name: "Pat", age: 52, gender: "Female", apartment_id: the_square)
joerge = Tenant.create(name: "Joerge", age: 48, gender: "Female", apartment_id: the_flowery)
lilford = Tenant.create(name: "Lilford", age: 64, gender: "Female", apartment_id: the_flowery)
reshoketjoe = Tenant.create(name: "Reshoketjoe", age: 42, gender: "Female", apartment_id: the_flowery)
