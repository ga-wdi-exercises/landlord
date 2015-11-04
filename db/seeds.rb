require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"

# Creates at least 3 instances of the apartment class
apartment1 = Apartment.create(address: "14092 Geraldine Court", monthly_rent: 1000, sqft: 2000, num_beds: 3, num_baths: 2);
apartment2 = Apartment.create(address: "5442 Lomax Way", monthly_rent: 1200, sqft: 2200, num_beds: 4, num_baths: 2);
apartment3 = Apartment.create(address: "1310 Floyd Ave", monthly_rent: 700, sqft: 1000, num_beds: 2, num_baths: 1);
# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
apartment.Tenant1.create(name: "Mariana Neal", age: 35, gender: "Female")
apartment.Tenant2.create(name: "Gordon Burke", age: 37, gender: "Male")
apartment.Tenant3.create(name: "Mark Simpson", age: 42, gender: "Male")
apartment.Tenant4.create(name: "Fred Lawrence", age: 36, gender: "Male")
apartment.Tenant5.create(name: "Zoe Soto", age: 45, gender: "Female")
apartment.Tenant6.create(name: "Evelyn Ross", age: 32, gender: "Female")
apartment.Tenant7.create(name: "Vera Mason", age: 30, gender: "Female")
apartment.Tenant8.create(name: "Sheri Martin", age: 32, gender: "Female")
apartment.Tenant9.create(name: "Craig Perry", age: 35, gender: "Male")
Tenent.create(... apartment1.apartment_id)
# queries for all instances of the Tenant class and stores it in a variable of your choice
renters = Tenant.all
# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
tenant = Tenant.find_by(apartment_id:(21))
# Updates attributes using attribute helper methods for one of the objects you've created
apartment = Apartment.where(address: "5442 Lomax Way")
apartment.update(address: "5004 Lomax Way")
# Saves an object that you updated using attribute helpers to the Database
apartment.save
# Updates an object using the update methods
UPDATE tenants SET name = "Sarah Mason" WHERE name = "Vera Mason";
vera = Tenant.find_by(name: "Vera Mason")
vera.update(name: "Sarah Mason")
# Deletes one of the objects you've created
DELETE * FROM apartments WHERE monthly_rent = 2000;
vera = Tenant.find_by(name: "Vera Mason")
vera.destroy
