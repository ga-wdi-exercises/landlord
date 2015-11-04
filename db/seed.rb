Apartment.destroy_all
Tenant.destroy_all

require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartments"
require_relative "../models/tenants"

apt1 = Apartment.create(address: "2454 Knowyourself Dr.", monthly_rent: 1300, sqft: 800, num_beds: 2, num_baths: 1)
apt2 = Apartment.create(address: "1234 Jah Bless Rd.", monthly_rent: 1000, sqft: 1420, num_beds: 3, num_baths: 2)
apt3 = Apartment.create(address: "666 Hell St.", monthly_rent: 666, sqft: 666, num_beds: 2, num_baths: 2)

apt3.tenants.create(name: "Satan", age: 666, gender: "Male")
apt3.tenants.create(name: "Spawn of Satan", age: 6, gender: "Male")
apt1.tenants.create(name: "Dr Seuss", age: 74, gender: "Male")
apt1.tenants.create(name: "Dr Quinn", age: 54, gender: "Female")
apt2.tenants.create(name: "Bob Marley", age: 76, gender: "Male")
apt2.tenants.create(name: "Ziggy Marley", age: 32, gender: "Male")
apt2.tenants.create(name: "Cedella Marley", age: 36, gender: "Female")
Tenant.create(name: "Donald Trump", age: 80, gender: "Male")
Tenant.create(name: "Ivana Trump", age: 42, gender: "Female")

all_tenants = Tenant.all

Apartment.last.tenants

last_apartment = Apartment.last
last_apartment.num_baths = 1

last_apartment.save

Apartment.last.update(sqft: 1666)

Tenant.all[8].destroy
# binding.pry
