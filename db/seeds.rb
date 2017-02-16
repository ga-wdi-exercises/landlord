require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all


#create new apartments
laurel = Apartment.create(address: "323 Thomas Drive", monthly_rent: 700, sqft: 750, num_beds: 2, num_baths: 1)
the_greens = Apartment.create(address: "361 The Greens Circle", monthly_rent: 975, sqft: 780, num_beds: 1, num_baths: 1)
hue = Apartment.create(address: "300 West Hargett Street", monthly_rent: 1175, sqft: 640, num_beds: 2, num_baths: 2)


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
laurel.tenants.create(name: "Ebenezer Williams", age: 28, gender: "Male")
laurel.tenants.create(name: "Allan Langat", age: 28, gender: "Male")
laurel.tenants.create(name: "Hamid Zouaoui", age: 28, gender: "Male")
the_greens.tenants.create(name: "Neil Samen", age: 28, gender: "Male")
the_greens.tenants.create(name: "James Namude", age: 28, gender: "Male")
the_greens.tenants.create(name: "Ruth Sims", age: 28, gender: "Female")
hue.tenants.create(name: "Bianca Pau", age: 28, gender: "Female")
hue.tenants.create(name: "Quinn Nam", age: 28, gender: "Female")
hue.tenants.create(name: "Andrew Chan", age: 28, gender: "Male")
