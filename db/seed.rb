require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apartment_one = Apartment.create(address:"1234 Fake Street", monthly_rent: 2500, sqft: 3000, num_beds: 5, num_baths: 5)

apartment_two = Apartment.create(address:"6243 Lee Road", monthly_rent: 1900, sqft: 2000, num_beds: 3, num_baths: 2)

apartment_three = Apartment.create(address:"9124 Broad Lane", monthly_rent: 1000, sqft: 1500, num_beds: 2, num_baths: 1)

apartment_one.tenants.create(name: "Brendan Lewis", age: 25, gender: "Male");
apartment_one.tenants.create(name: "John Smith", age: 27, gender: "Male");
apartment_one.tenants.create(name: "Brianna Hoff", age: 23, gender: "Female");
apartment_one.tenants.create(name: "Cash Money", age: 30, gender: "Male");
apartment_one.tenants.create(name: "Jihoon Lee", age: 20, gender: "Male");

apartment_two.tenants.create(name: "James Brown", age: 65, gender: "Male");
apartment_two.tenants.create(name: "Jane Brown", age: 62, gender: "Female");

apartment_three.tenants.create(name: "Qui Gon Gin", age: 1000, gender: "Male");
apartment_three.tenants.create(name: "Yoda", age: 5000, gender: "Male");

tenants = Tenant.all

apt_one_tenants = Apartment.find_by(address: "1234 Fake Street").tenants

apartment_two = Apartment.find_by(address: "6243 Lee Road")
apartment_two.update(address: "9120 Fairway Drive")
apartment_two.save

james_brown = Tenant.find_by(name: "James Brown").update(age: 66)

Tenant.find_by(name: "Qui Gon Gin").destroy
