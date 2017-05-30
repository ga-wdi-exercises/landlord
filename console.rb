require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"
# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

apartment = Apartment.all
tenant = Tenant.all

puts "Welcome to Landlord. Choose one of the following:"
   puts "1 - View All Apartments"
   puts "2 - View All Tenants"
   puts "3 - All Apartments and its tenants"

   input = gets.chomp

  if input == "1"
    apartment.each do |apartment|
      puts "ID: #{apartment.id}, Adress: #{apartment.address}, Monthly Rent: #{apartment.monthly_rent}"
    end

  elsif input == "2"
    tenant.each do |tenant|
      puts "Name: #{tenant.name}, Age: #{tenant.age}"
    end

# will work on it
  elsif input == "3"
    apartment.each do |apartment|
      # puts apartment
      tenant.each do |tenant|

    if apartment.id == tenant.apartment_id
      puts "#{apartment.address}, #{tenant.name}"
      # puts tenant
    end
  end
end
  else
      puts "Invalid option."
end




binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
