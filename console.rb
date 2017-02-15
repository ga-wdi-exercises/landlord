require "pg" # postgres db library
require "active_record" # the ORM
# require "pry" # for debugging

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

puts "\n\n"
puts "********** Welcome to Landlord **********"
puts "\n"
puts "Press 1: View a List of All Apartments"
puts "Press 2: View a List of All Tenants"
puts "Press 3: See a List of Apartments and their respective Tenants"
puts "\n"
input = 4

while input != "exit" || input != "Exit"

  input = gets.chomp

  if input == "0"
    puts "\n\n"
    puts "********** Welcome to Landlord **********"
    puts "\n"
    puts "Press 1: View a List of All Apartments"
    puts "Press 2: View a List of All Tenants"
    puts "Press 3: See a List of Apartments and their respective Tenants"
    puts "\n"
    input = 4
  elsif input == "1"
    puts "\n\nAll Apartments"
    puts "\n"
    Apartment.all.each do |apartment|
      puts "#{apartment.address} has an ID of #{apartment.id} and costs $#{apartment.monthly_rent}/month."
    end
    puts "\n\nPress 0 to Return to the Main Screen"
    puts "\n"
    input = 4
  elsif input == "2"
    puts "\n\nAll Tenants"
    puts "\n"
    Tenant.all.each do |tenant|
      puts "#{tenant.name} is #{tenant.age} years old."
    end
    puts "\n\nPress 0 to Return to the Main Screen"
    puts "\n"
    input = 4
  elsif input == "3"
    puts "\n\nTenants Living in Each Apartment"
    puts "\n"
    Apartment.all.each do |apartment|
      puts "\n#{apartment.address} houses: "
      apartment.tenants.each do |tenant|
        puts "#{tenant.name}"
      end
    end
    puts "\n\nPress 0 to Return to the Main Screen"
    puts "\n"
      input = 4
  end
end
# binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
