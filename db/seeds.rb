require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`

require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"


Apartment.destroy_all
Tenant.destroy_all
# destroys existing data in database

# Creates at least 3 instances of the apartment class
apartment1 = Apartment.create(address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths: 2);
apartment2 = Apartment.create(address: "7357 Emard Row ", monthly_rent: 2600, sqft: 2300, num_beds: 3, num_baths: 2);
apartment3 = Apartment.create(address: "0889 Marvin Radial", monthly_rent: 1100, sqft: 500, num_beds: 3, num_baths: 2);

#Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
Tenant.create(name: "Rosalinda Champlin", age: 39, gender: "Male",  apartment_id: apartment1.id);
Tenant.create(name: "Valentin Keebler Sr.", age: 74, gender: "Male", apartment_id: apartment1.id);
Tenant.create(name: "Ms. Garland Beatty", age: 60, gender: "Female", apartment_id: apartment1.id);
Tenant.create(name: "Eryn Lynch", age: 12, gender: "Male", apartment_id: apartment1.id);
Tenant.create(name: "Tiara Conn", age: 3,  gender: "Male", apartment_id: apartment1.id);
Tenant.create(name: "Maudie Mosciski", age: 90, gender: "Female", apartment_id: apartment2.id);
Tenant.create(name: "Demario King", age: 71, gender: "Female",  apartment_id: apartment2.id);
Tenant.create(name: "Kristin Wisoky", age: 23, gender: "Female",  apartment_id: apartment3.id);
Tenant.create(name: "Demario King", age: 71, gender: "Female",  apartment_id: apartment3.id);

binding pry
#queries for all instances of the Tenant class and stores it in a variable of your choice
# Tenant.all
# tenants_all = Tenant.all
#
# #queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
# apartment1.tenants
# tenant_apt1 = apartment1.tenants
#
# #Updates attributes using attribute helper methods for one of the objects you've created
# apartment1.update(monthly_rent: 850, sqft: 2000)
#
# #Saves an object that you updated using attribute helpers to the Database
# tenant_apt1.save
#
# #Updates an object using the update methods
# apartment2.update(monthly_rent: 2600, sqft: 2400)
#
# #Deletes one of the objects you've created
# tenant_apt1.destroy
