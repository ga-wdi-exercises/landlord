require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

# Creates at least 3 instances of the apartment class
apt1 = Apartment.create(address:"1254 Crack Street", monthly_rent: 2400, sqft:"830", num_beds:"4", num_baths:"2")
apt2 = Apartment.create(address:"9 Willmington Ct", monthly_rent: 1800, sqft:"1000", num_beds:"2", num_baths:"1")
apt3 = Apartment.create(address:"34 Black Pearl Drive", monthly_rent: 1600, sqft:"500", num_beds:"3", num_baths:"1")
# Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
apt1.tenants.create(name:"William Clinton", age: 69, gender:"male")
apt1.tenants.create(name:"Jack Johnson", age: 40, gender:"male", apartment_id: 2)
apt1.tenants.create(name:"Captain Barbosa", age: 58, gender:"male", apartment_id: 3)
apt1.tenants.create(name:"Queen Elizabeth", age: 90, gender:"female", apartment_id: 1)
apt2.tenants.create(name:"Oprah Winfrey", age: 70, gender:"female", apartment_id: 1)
apt2.tenants.create(name:"Jimmiy Bob", age: 9, gender:"male", apartment_id: 1)
apt3.tenants.create(name:"Suzie Queen", age: 14, gender:"female", apartment_id: 1)
apt3.tenants.create(name:"Jane Austin", age: 34, gender:"female", apartment_id: 1)
apt3.tenants.create(name:"Jay Tolkien", age: 25, gender:"male", apartment_id: 1)
# queries for all instances of the Tenant class and stores it in a variable of your choice
tenant_all = Tenant.all
# queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
tenant_apt3 = Tenant.where(apartment_id:3)
# Updates attributes using attribute helper methods for one of the objects you've created
oprah = Tenant.find(5)
oprah.apartment.monthly_rent = 2000
# Saves an object that you updated using attribute helpers to the Database
oprah.apartment.save
# Updates an object using the update methods
oprah.update(age:80)
# Deletes one of the objects you've created
jimmiy = Tenant.find(6)
jimmiy.destroy
