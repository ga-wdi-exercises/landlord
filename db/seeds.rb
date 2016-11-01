require_relative "connection"
require_relative "../models/apartment" # require the Artist class definition that we defined in the models/artist.rb file
require_relative "../models/tenant" # require the Artist class definition that we defined in the models/artist.rb file

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
testApt1 = Apartment.create(address: "1617 Carlin Ln", monthly_rent: 10000, sqft: 10000, num_beds: 7, num_baths: 6)
testApt2 = Apartment.create(address: "234 Address Ave", monthly_rent: 1200, sqft: 999, num_beds: 1, num_baths: 1)
testApt3 = Apartment.create(address: "9000 Stuff St", monthly_rent: 900, sqft: 1500, num_beds: 2, num_baths: 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
guy1 = Tenant.create(name: "guy1", age: 30, gender: "Male", apartment_id: 108)
guy2 = Tenant.create(name: "guy2", age: 30, gender: "Male", apartment_id: 108)
guy3 = Tenant.create(name: "guy3", age: 30, gender: "Male", apartment_id: 109)
guy4 = Tenant.create(name: "guy4", age: 30, gender: "Male", apartment_id: 109)
guy5 = Tenant.create(name: "guy5", age: 30, gender: "Male", apartment_id: 110)
guy6 = Tenant.create(name: "guy6", age: 30, gender: "Male", apartment_id: 110)
guy7 = Tenant.create(name: "guy7", age: 30, gender: "Male", apartment_id: 108)
guy8 = Tenant.create(name: "guy8", age: 30, gender: "Male", apartment_id: 109)
guy9 = Tenant.create(name: "guy9", age: 30, gender: "Male", apartment_id: 110)
