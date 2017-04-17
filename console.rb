require 'active_record'
require 'pry'

require_relative '../models/apartment'
require_relative '../models/tenant'
require_relative '../config/connection.rb'


Apartment.create([
  {address: "1245 K St", monthly_rent: 1600,  sqft: 1100, num_beds: 1, num_baths: 1},
  {address: "4563 L St", monthly_rent: 1900,  sqft: 1200, num_beds: 2, num_baths: 1},
  {address: "3452 M St", monthly_rent: 1000,  sqft: 900, num_beds: 2, num_baths: 2}
  ])

Apartment.all[0].tenants.create([
  {name: "Ronny", age: 24, gender: "f"},
  {name: "Mike", age: 26, gender: "m"},
  {name: "Jira", age: 32, gender: "f"}
  ])
Apartment.all[1].tenants.create([
  {name: "Meag", age: 52, gender: "f"},
  {name: "Maria", age: 44, gender: "f"},
  {name: "Huey", age: 28, gender: "m"}
  ])
Apartment.all[2].tenants.create([
  {name: "Paul", age: 32, gender: "m"},
  {name: "Amy", age: 24, gender: "f"},
  {name: "Cora", age: 37, gender: "f"}
  ])


all_tenants = Tenant.all

Apartment.first.tenants

first_street_apt = Apartment.first
first_street_apt.monthly_rent = 1600


Tenant.last.update(age: 25)


# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
