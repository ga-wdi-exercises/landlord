require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require "pry" # for debugging


# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."


def menu
  puts "please choose a menu item Number"
  puts "1. Apartments"
  puts "2. Tenants"
  puts "3. Tenants by Apartment"
  puts "Close"
end

user_input = gets.chomp.to_s

user_input = menu

while input != "close"
  if user_input == 1
    puts "Apartments in Building:"

    Apartment.each do |apartment|
      puts "#{apartment.address}, #{apartment.monthly_rent}, #{apartment.sqft}, #{apartment.num_beds}, #{apartment.num_baths}"
    end

  elsif user_input == 2
    puts "Tenants in Building"
    Tenant.each do |tenants|
      puts "#{tenants.name}, #{tenants.age}, #{tenants.gender}, #{tenants.apartment_id}"
    end
  elsif user_input == 3
    puts "Tenants by Apartments"
    Apartment.all.each do |apartment|
      puts "#{apartment.address}"
    apartment.tenants.each do |tenants|
        puts "#{tenants.name}"
      end
    end
  end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
