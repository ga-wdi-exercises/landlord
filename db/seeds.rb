require "bundler/setup"
require "pg"
require "active_record"
require "pry"


require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

# 1 and 2
apt1 = Apartment.create(address: "123 abc st", monthly_rent: 700, sqft: 725, num_beds: 1, num_baths: 1)
apt2 = Apartment.create(address: "456 abc st", monthly_rent: 800, sqft: 825, num_beds: 2, num_baths: 1)
apt3 = Apartment.create(address: "987 fun st", monthly_rent: 1300, sqft: 1200, num_beds: 4, num_baths: 1)
apt1.tenants.create(name: "Josh", age: 24, gender: "Male")
apt1.tenants.create(name: "Shana", age: 24, gender: "Female")
apt2.tenants.create(name: "Joe", age: 27, gender: "Male")
apt2.tenants.create(name: "Tom", age: 24, gender: "Male")
apt3.tenants.create(name: "Mo", age: 25, gender: "Male")
apt3.tenants.create(name: "Bo", age: 25, gender: "Male")
apt3.tenants.create(name: "Justine", age: 24, gender: "Female")
apt3.tenants.create(name: "Christine", age: 22, gender: "Female")
apt3.tenants.create(name: "Kate", age: 21, gender: "Female")
Tenant.create(name: "Jane", age: 20, gender: "Female")

binding.pry

# 3 -
# all_tenants = Tenant.all

# 4 - apt1_tenants = apt1.tenants

# 5 and 6- josh = Tenant.find_by(name: "Josh")
# josh.update(name: "Joshua", age: 25)

# 7 - josh.destroy
