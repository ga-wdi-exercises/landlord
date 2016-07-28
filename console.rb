require 'pg'
require 'pry'
require 'active_record'

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
#
binding.pry
#
# puts "ignore this line, it's just here so the binding.pry above works"

user_input = ""
while user_input != 'exit'

  puts "To view all apartments: Press 1, To view all tenants: Press 2, To view both: Press: 3. If not, Type: 'exit'."

  user_input = gets.chomp

  if user_input == 1
    Apartment.all.each do |apartment|
      puts "ID: #{apartment.id}, Address: #{apartment.address}, Rent: #{apartment.monthly_rent}"
    end
  elsif user_input == 2
    Tenant.all.each do |tenant|
      puts "Tenant: #{tenant.name}, Age: #{tenant.age}"
    end
  elsif user_input == 3
    Apartment.all.each do |apartment|
      apartment.tenants.each do |tenant|
        puts "Address: #{apartment.address}, Tenants: #{tenant.name}"
      end
    end
  else
    puts "See you soon!"
  end
end
