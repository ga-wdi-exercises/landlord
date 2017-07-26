require 'bundler/setup'
require 'pry'

require_relative '../db/connection.rb'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

apt_1 = Apartment.create(address: "9841 Tanner Key", monthly_rent: 606, sqft: 779, num_beds: 2, num_baths: 1)
apt_2 = Apartment.create(address: "6971 Corwin Locks", monthly_rent: 1600, sqft: 650, num_beds: 1, num_baths: 1)
apt_3 = Apartment.create(address: "630 McDermott Islands", monthly_rent: 1200, sqft: 500, num_beds: 1, num_baths: 1)

apt_1.tenants.create(name: "Ms. Maryse Farrell", age: 87, gender: 'Female')
apt_1.tenants.create(name: "Maci Hickle II", age: 28, gender: 'Female')
apt_1.tenants.create(name: "Jordan Cremin DDS", age: 54, gender: 'Male')
apt_2.tenants.create(name: "Haven Abbott", age: 79, gender: 'Female')
apt_2.tenants.create(name: "Roxane Walter", age: 51, gender: 'Female')
apt_2.tenants.create(name: "Dr. Everett Kuhn", age: 71, gender: 'Male')
apt_3.tenants.create(name: "Ella Quigley DDS", age: 40, gender: 'Female')
apt_3.tenants.create(name: "Miss Flavio Wyman", age: 64, gender: 'Female')
apt_3.tenants.create(name: "Mathilde Beatty", age: 83, gender: 'Female')
