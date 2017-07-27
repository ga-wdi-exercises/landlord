require "pg"
require "active_record"
require "pry"

require_relative "../models/apartment"
require_relative "../models/tenant"

require_relative "../db/connection.rb"

Tenant.destroy_all

Apartment.destroy_all

Apartment.create([
  {address:"123 barber st", monthly_rent: 900, sqft: 3000, num_beds: 3, num_baths: 2},
  {address:"2020 16th st", monthly_rent: 500, sqft: 1500, num_beds: 2, num_baths: 4},
  {address:"1152 J ST NW", monthly_rent: 800, sqft: 2200, num_beds: 4, num_baths: 3}
])
Tenant.create([
  {name:"Jacob Greenwald", age: 28, gender: 'Male', apartment_id: 52},
  {name:"Eric Lastname", age: 32, gender: 'Undecided', apartment_id: 52},
  {name: "Randal Calrissian", age: 72, gender: "Male", apartment_id: 53},
  {name: "Laura Erickson", age: 27, gender: "Female", apartment_id: 54},
  {name: "Brandal Lothrifson", age: 22, gender: "Male", apartment_id: 54},
  {name: "Mickey Mouserson", age: 29, gender: "Mouse", apartment_id: 53},
  {name: "Goofy", age: 26, gender: "Dog", apartment_id: 54},
  {name: "Cher", age: 45, gender: "Female", apartment_id: 54},
  {name: "John Smith", age: 18, gender: "Male", apartment_id: 53}
])
