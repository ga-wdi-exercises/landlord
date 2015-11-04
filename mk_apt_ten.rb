require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

puts "Would you like to create an Apartment or Tenant?"
response = gets.chomp.to_s

if response == "Apartment"
    puts "Address?"
    address= gets.chomp.to_s

    puts "Monthly Rent?"
    monthly_rent = gets.chomp.to_i

    puts "Square Feet?"
    sqft = gets.chomp.to_i

    puts "Number of Beds?"
    num_beds = gets.chomp.to_i

    puts "Number of Bathrooms?"
    num_baths = gets.chomp.to_i

    Apartment.create(address:address, monthly_rent:monthly_rent, sqft:sqft, num_beds:num_beds, num_baths: num_baths)
elsif response == "Tenant"
    puts "Name?"
    name= gets.chomp.to_s

    puts "Age?"
    age = gets.chomp.to_i

    puts "Gender?"
    gender = gets.chomp.to_s

    puts "Apartment Number?"
    apartment_id = gets.chomp.to_i

    Tenant.create(name:name, age:age, gender:gender, apartment_id:apartment_id)
else
  puts "That is not an option!"
end

#finished sweet!
