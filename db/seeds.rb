require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "../db/connection"
require_relative "../models/apartments"
require_relative "../models/tenants"

Apartment.destroy_all
Tenant.destroy_all

Apartment.create(address:"123 ABC Street", monthly_rent:100000000, sqft:200, num_beds:12, num_baths:0)
Apartment.create(address:"4000 Dead End", monthly_rent:1000, sqft:20000, num_beds:2, num_baths:10)
Apartment.create(address:"1 No Name", monthly_rent:10, sqft:40, num_beds:5, num_baths:5)

Tenant.create(name:"Bill",age:20,gender:"Male",apartment_id:1)
Tenant.create(name:"Bobby",age:82,gender:"Male",apartment_id:1)
Tenant.create(name:"Thelma",age:65,gender:"Female",apartment_id:3)
Tenant.create(name:"Roger",age:40,gender:"Male",apartment_id:2)
Tenant.create(name:"Mary",age:20,gender:"Female",apartment_id:3)
Tenant.create(name:"Wendy",age:99,gender:"Female",apartment_id:2)
Tenant.create(name:"Jim",age:20,gender:"Male")
Tenant.create(name:"Gladys",age:100,gender:"Female")
Tenant.create(name:"Henry",age:90,gender:"Male")
Tenant.create(name:"Buck",age:10,gender:"Male")

tenants_all = Tenant.all
apt1_tenants = Apartment.first.tenants

abc_street = Apartment.first
abc_street.num_beds = 5
abc_street.save

Tenant.find_by(name:"Gladys").update(age: 25)
Tenant.find_by(name:"Buck").destroy

# binding.pry
#
# 
# - Creates at least 3 instances of the apartment class
# - Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
# - queries for all instances of the Tenant class and stores it in a variable of your choice
# - queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
# - Updates attributes using attribute helper methods for one of the objects you've created
# - Saves an object that you updated using attribute helpers to the Database
# - Updates an object using the update methods
# - Deletes one of the objects you've created
