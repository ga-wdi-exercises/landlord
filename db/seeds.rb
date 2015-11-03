require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

# address TEXT,
# monthly_rent INTEGER,
# sqft INTEGER,
# num_beds INTEGER,
# num_baths INTEGER

# name TEXT,
# age INTEGER,
# gender TEXT,
# apartment_id INTEGER


apt1 = Apartment.create(address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths:2)
apt2 = Apartment.create(address: "44010 Lemke Crossroad", monthly_rent: 1000, sqft: 1300, num_beds: 1, num_baths:3)
apt3 = Apartment.create(address: "77841 Jany Lane", monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths:3)
apt3.tenants.create(name: "Joe GZ", age: 27, gender: "male")
apt3.tenants.create(name: "Jennifer Lawrence", age: 27, gender: "female")
apt1.tenants.create(name: "Kristin Wisoky", age: 45, gender: "female")
apt1.tenants.create(name: "Josh Cohen", age: 31, gender: "male")
apt2.tenants.create(name: "Maggy Green", age: 25, gender: "female")
rick = Tenant.create(name: "Rick Grimes", age: 40, gender: "male")
daryl = Tenant.create(name: "Daryl Dixon", age: 35, gender: "male")
michonne = Tenant.create(name: "Michonne Onename", age: 30, gender: "female")
glenn = Tenant.create(name: "Glenn Rhee", age: 27, gender: "male")

tenant_all = Tenant.all
tenant_apt = Tenant.where.not(apartment_id:nil)
kristin = Tenant.find(3)
apt3 = Apartment.find(3)
kristin.apartment = apt3
kristin.save
kristin = Tenant.find(3)
kristin.update(name:"Caroline")
josh = Tenant.find_by(name:"Josh Cohen")
josh.destroy
