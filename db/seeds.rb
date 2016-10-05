require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

harbor_point = Apartment.create(address: "606 Harbor Point", monthly_rent: 700, sqft: 1400, num_beds: 2, num_baths: 2)
the_envoy = Apartment.create(address: "2400 16th Street NW", monthly_rent: 2000, sqft: 620, num_beds: 1, num_baths: 1)
louis = Apartment.create(address: "1920 14th Street NW", monthly_rent: 2759, sqft: 627, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
harbor_point.tenants.create(name: "Ethan Davila", age: 15, gender: "Female")
harbor_point.tenants.create(name: "John Davila", age: 56, gender: "Male")
harbor_point.tenants.create(name: "Eliana Davila", age: 18, gender: "Female")
the_envoy.tenants.create(name: "Mariana Lungu", age: 32, gender: "Female")
the_envoy.tenants.create(name: "Jonathan Davila", age: 28, gender: "Male")
the_envoy.tenants.create(name: "Victoria Davila", age:3, gender: "Male")
louis.tenants.create(name: "Irina Popescu", age: 26, gender: "Female")
louis.tenants.create(name: "Nicole Miller", age: 28, gender: "Female")
louis.tenants.create(name: "Oleg Hmeli", age: 30, gender: "Male")
