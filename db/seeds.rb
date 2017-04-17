require 'active_record'
require 'pry'

require_relative '../models/apartment'
require_relative '../models/tenant'
require_relative '../db/connection.rb'


Tenant.destroy_all
Apartment.destroy_all

apt_1 = Apartment.create(address: "111 general assembly", monthly_rent: 1000, sqft: 1000, num_beds: 1, num_baths: 1)


apt_2 = Apartment.create(address: "222 general assembly", monthly_rent: 2000, sqft: 2000, num_beds: 2, num_baths: 2)


apt_3 = Apartment.create(address: "333 general assembly", monthly_rent: 3000, sqft: 3000, num_beds: 3, num_baths: 3)


ick = Tenant.create(name: "Ick", age: "26", gender: "Male", apartment_id: 23)


kwon = Tenant.create(name: "Kwon", age: "27", gender: "Male", apartment_id: 22)


hyun = Tenant.create(name: "Hyun", age: "26", gender: "Male", apartment_id: 24)

john = Tenant.create(name: "John", age: "25", gender: "Male", apartment_id: 24)


andy = Tenant.create(name: "Andy", age: "35", gender: "Male", apartment_id: 24)


jana = Tenant.create(name: "Jana", age: "26", gender: "Female", apartment_id: 21)


marcus = Tenant.create(name: "Marcus", age: "29", gender: "Male", apartment_id: 21)


jeong = Tenant.create(name: "Jeong", age: "22", gender: "Female", apartment_id: 18)


juan = Tenant.create(name: "Juan", age: "22", gender: "Male", apartment_id: 17)
