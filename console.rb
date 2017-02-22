require "bundler"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

#  Uncomment the lines below to verify that your seed script is working
#
# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

#
# puts "****************************************************************************************"
# puts "Hi there. Welcome to Landlord.  Enter 1 to see all apartments. Enter 2 to see all the tenants.  Enter 3 all apartments and their associated tenants. Enter 4 to exit."
# puts "****************************************************************************************"
#
# userInput = gets.chomp.to_s
#
# if userInput == 1.to_s
#   Apartment.all.each do |apartment|
#     puts "ID: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: #{apartment.monthly_rent}"
#   end
# elsif userInput == 2.to_s
#   Tenant.all.each do |tenant|
#     puts "Name: #{tenant.name}, Age: #{tenant.age}"
#   end
# elsif userInput == 3.to_s
#   Apartment.all.each do |apartment|
#     apartment.tenants.each do |tenant|
#       puts "Apartment: #{apartment.address}, Tenants: #{tenant.name} age: #{tenant.age}"
#     end
#   end
# else
#   puts "Goodbye."
# end

#
# 1. See a list of all apartments (include ID#, address, and monthly rent)
# 2. See a list of all tenants (include name and age)
# 3. See a list of all apartments and their associated tenants (just address and name)

binding.pry

puts "this line fixes binding.pry bug"
