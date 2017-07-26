require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

ruby_apartments = Apartment.all
ruby_tenants = Tenant.all

run = true

while run do

  puts " "
  puts "*************************************"
  puts "Welcome Bob Pizza"
  puts "Please Make your Selection"
  puts "1 ==> View all apartments"
  puts "2 ==> View all tenants"
  puts "3 ==> View apartments with their tenants"
  puts "0 ==> Exit Program"

  input = gets.chomp.to_i

  if input == 1
    puts "Printing out apartment data..."
    ruby_apartments.each do |i|
      puts "ID: " + i.id.to_s
      puts "Address: " + i.address.to_s
      puts "Montly Rent: " + i.monthly_rent.to_s
    end

  elsif input == 2
    puts "Printing out tenant data..."
    ruby_tenants.each do |i|
      puts "Name: " + i.name
      puts "Age: " + i.name.to_s
    end

  elsif input == 3
    puts "Printing out apartments with tenants..."
    ruby_apartments.each do |apt|
      puts apt[:address] + ": "
      id = apt[:id]
      match = ruby_tenants.find_all { |person| person[:apartment_id] == id}
        match.each do |person|
          puts "   " + person[:name]
        end
    end

  elsif input == 0
  run = false
end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
