require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# Uncomment the lines below to verify that your seed script is working

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

# Build out a simple command line interface that provides a menu prompt and allows the user to:
#
# See a list of all apartments (include ID#, address, and monthly rent)
# See a list of all tenants (include name and age)
# See a list of all apartments and their associated tenants (just address and name)

input = ""
while input != 'exit'

  puts "Welcome to the landlord database. Type '1' to see all apartments, '2' to see all tenants, '3' to view them together, or 'exit'."
  input = gets.chomp
  if input == '1'
    Apartment.all.each do |apartment|
      puts "ID: #{apartment.id}, Address: #{apartment.address}, Rent: #{apartment.monthly_rent}"
    end
  elsif input == '2'
    Tenant.all.each do |tenant|
      puts "Tenant: #{tenant.name}, age #{tenant.age}"
    end
  elsif input == '3'
    Apartment.all.each do |apartment|
      apartment.tenants.each do |tenant|
        puts "Address: #{apartment.address}, tenants include #{tenant.name}"
      end
    end
  else
    puts "Goodbye"
  end
end



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
