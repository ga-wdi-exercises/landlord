require 'sinatra'
require 'sinatra/reloader'
require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"
binding.pry

=begin
Creates at least 3 instances of the apartment class
Apartment.create(address: "123 Birdy Lane", monthly_rent: 500, sqft: 1200, num_beds: 1, num_baths: 1)
Apartment.create(address: "345 Cat Street", monthly_rent: 600, sqft: 1500, num_beds: 2, num_baths: 1)
Apartment.create(address: "567 Dog Road", monthly_rent: 800, sqft: 1700, num_beds: 3, num_baths: 2)

Creates at least 9 instances of the Tenant class. At least 5 should belong to an apartment
1. Tenant.create(name: "Ly Nguyen", age: 29, gender: "Female", apartment_id: 3)
2. Tenant.create(name: "Laurence Wilson", age: 29, gender: "Male", apartment_id: 3)
3. Tenant.create(name: "Lilly Nguyen", age: 8, gender: "Female", apartment_id: 6)
4. Tenant.create(name: "Jason Nguyen", age: 13, gender: "Male", apartment_id: 6)
5. Tenant.create(name: "Lan Dao", age: 48, gender: "Female", apartment_id: 1)
6. Tenant.create(name: "Kevin Nguyen", age: 50, gender: "Male")
7. Tenant.create(name: "Aura Barreto", age: 30, gender: "Female")
8. Tenant.create(name: "Carolina Barreto", age: 30, gender: "Female")
9. Tenant.create(name: "Melissa Herrera", age: 30, gender: "Female")

Queries for all instances of the Tenant class and stores it in a variable of your choice
all_tenants = Tenant.all

Queries for all instances of the Tenant class that belong to one of the Apartments you created and stores it in a variable of your choosing.
bird_tenants = Apartment.where(address: "123 Birdy Lane").tenants

Updates attributes using attribute helper methods for one of the objects you've created
birdy_apt = Apartment.where(address: "123 Birdy Lane")
birdy_apt.update(num_beds: 2)

Saves an object that you updated using attribute helpers to the Database
birdy_apt.save (but doesn't update already save?)

Updates an object using the update methods
birdy_apt.save (but doesn't update already save?)

Deletes one of the objects you've created
birdy_apt.destroy

=end
