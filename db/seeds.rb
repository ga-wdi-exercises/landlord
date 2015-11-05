require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

Apartment.create(address: "105 Seacrest Drive", monthly_rent: 1200, sqft: 3200, num_beds: 12, num_baths: 9)
Apartment.create(address: "106 Seacrest Drive", monthly_rent: 1500, sqft: 3290, num_beds: 8, num_baths: 7)
Apartment.create(address: "320 Dead Man's Circle", monthly_rent: 1800, sqft: 5934, num_beds: 22, num_baths: 15)

Tenant.create(name: "Ted Williams", age: 26, gender: "male", apartment_id: Apartment.find_by(address: "105 Seacrest Drive").id)
Tenant.create(name: "Bob Johnson", age: 56, gender: "male", apartment_id: Apartment.find_by(address: "105 Seacrest Drive").id)
Tenant.create(name: "Chrstine Adams", age: 32, gender: "male", apartment_id: Apartment.find_by(address: "106 Seacrest Drive").id)
Tenant.create(name: "Fred Williamson", age: 78, gender: "male", apartment_id: Apartment.find_by(address: "106 Seacrest Drive").id)
Tenant.create(name: "Garth Frederickson", age: 90, gender: "male", apartment_id: Apartment.find_by(address: "105 Seacrest Drive").id)
Tenant.create(name: "Pete Cobbler", age: 2, gender: "male", apartment_id: Apartment.find_by(address: "320 Dead Man's Circle").id)
Tenant.create(name: "Jim Billings", age: 34, gender: "male", apartment_id: Apartment.find_by(address: "105 Seacrest Drive").id)
Tenant.create(name: "Kathryn Gardener", age: 56, gender: "male", apartment_id: Apartment.find_by(address: "320 Dead Man's Circle").id)
Tenant.create(name: "James Jones", age: 12, gender: "male", apartment_id: Apartment.find_by(address: "320 Dead Man's Circle").id)

binding.pry

all_tenants = Tenant.all
all_apts = Apartment.all

dead_tenants = Apartment.find_by(address: "320 Dead Man's Circle").tenants

dead_man_apt = Apartment.find_by(address: "320 Dead Man's Circle")
dead_man_apt.address = "319 Dead Man's Circle"
dead_man_apt.save
dead_man_apt.update(address: "320 Dead Man's Circle")

dead_man_apt.delete
