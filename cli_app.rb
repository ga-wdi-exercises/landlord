require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
  
puts "do you want to enter a new address (yes/no)?"
answer = gets.chomp.to_s
if answer == "yes"
  puts "Please enter an address"
  address = gets.chomp.to_s

  puts "Please enter the rent"
  rent = gets.chomp.to_i

  puts "Please enter the sqft"
  sqft = gets.chomp.to_i

  puts "Please enter number of beds"
  num_beds = gets.chomp.to_i

  puts "Please enter an number of baths"
  num_baths = gets.chomp.to_i

  new_apt = Apartment.create(address: "#{address}", monthly_rent: rent, sqft: sqft, num_beds: num_beds, num_baths:num_baths)
end

puts "do you want to enter a new tenant (yes/no)?"
answer = gets.chomp.to_s
if answer == "yes"
  puts "Please enter a name"
  name = gets.chomp.to_s

  puts "Please enter an age"
  age = gets.chomp.to_i

  puts "Please enter the gender"
  gender = gets.chomp.to_s

  new_tenant = Tenant.create(name: "#{name}", age: age, gender: "#{gender}")
end
