require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


answer = ""

while answer != "exit"
puts "What would you like to do? Please select one of the following: evict, change rent, assign, add apt, add tenant, exit"
answer = gets.chomp.to_s

if answer == "add apt"
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

if answer == "add tenant"
  puts "Please enter a name"
  name = gets.chomp.to_s

  puts "Please enter an age"
  age = gets.chomp.to_i

  puts "Please enter the gender"
  gender = gets.chomp.to_s

  new_tenant = Tenant.create(name: "#{name}", age: age, gender: "#{gender}")
end

if answer == "evict"
  Tenant.find_each {|tenant| puts tenant.name}
  puts "Who do you want to evict?"
  evict = gets.chomp.to_s
  to_evict = Tenant.find_by(name:evict)
  to_evict.destroy
end

if answer == "assign"
  Tenant.find_each {|tenant| puts tenant.name}
  puts "Who do you want to assign?"
  tenant = gets.chomp.to_s
  to_move = Tenant.find_by(name:tenant)
  Apartment.find_each {|apartment| puts apartment.address}
  puts "Where do you want to move #{tenant}?"
  apt = gets.chomp.to_s
  new_apt = Apartment.find_by(address:apt)
  to_move.apartment_id = new_apt.id
  to_move.save
  puts "#{tenant} has been move to #{apt}"
end

if answer == "change rent"
  Apartment.find_each {|apartment| puts "#{apartment.address} $#{apartment.monthly_rent}"}
  puts "For which apartment are you changing the rent?"
  apt = gets.chomp.to_s
  to_raise = Apartment.find_by(address:apt)
  puts "How much do you want to change the rent?"
  rent = gets.chomp.to_i
  to_raise.monthly_rent = to_raise.monthly_rent + rent
  to_raise.save
end

end
