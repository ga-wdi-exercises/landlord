require "bundler/setup"
require "active_record"
require "pg"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

apt1 = Apartment.create(address: "111 Main St", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)

apt2 = Apartment.create(address: "222 Main St", monthly_rent: 2000, sqft: 2000, num_beds: 2, num_baths: 2)

apt3 = Apartment.create(address: "333 Main St", monthly_rent: 3000, sqft: 3000, num_beds: 3, num_baths: 3)

tenant_a = apt1.tenants.create(name: "Abigail Adams", age: 21, gender: "Female")

tenant_b = apt2.tenants.create(name: "Bill Babbcock", age: 23, gender: "Male")

tenant_c = apt2.tenants.create(name: "Carl Cameron", age: 24, gender: "Male")

tenant_d = apt3.tenants.create(name: "Daisy Duke", age: 25, gender: "Female")

tenant_e = apt3.tenants.create(name: "Elsworth Everest", age: 26, gender: "Male")

tenant_f = apt3.tenants.create(name: "Franny Farmer", age: 27, gender: "Female")

tenant_g = Tenant.create(name: "Gilbert Grape", age: 28, gender: "Male")

tenant_h = Tenant.create(name: "Hamilton Harvey", age: 29, gender: "Male")

tenant_i = Tenant.create(name: "Ilsa Irving", age: 30, gender: "Female")

all_tenants = Tenant.all

apt1_tenants = apt1.tenants

tenant_a.name = "Amy Argyle"

tenant_a.save

tenant_b.update(name: "Bob Barkley", age: 123)

tenant_c.destroy

binding.pry
