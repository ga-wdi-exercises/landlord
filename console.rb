require 'active_record'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


# : Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."
#


# def menu
#     option = nil
#     while option != 0
#       puts "*" * 50
#       puts "Choose one of the following:"
#       puts "1: See All Apartments"
#       puts "2: See All Tenants"
#       puts "3: See All Apartments and Tenants in the Apartment"
#       puts "0: Exit program"
#       option = gets.chomp.to_i
#       if option == 1
#         puts "All Apartments"
#         puts "-" * 50
#         Apartment.all.each do |apartment|
#           puts "id: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: #{apartment.monthly_rent}"
#         end
#       end
#       if option == 2
#         puts "All Tenants"
#         puts "-" * 50
#         Tenant.all.each do |tenant|
#           puts "Name: #{tenant.name} , Age: #{tenant.age}"
#         end
#       end
#       if option == 3
#         puts "All Apartments and Tenants Residing"
#         puts "-" * 50
#         Apartment.all.each do |apartment|
#           puts "Address: #{apartment.address}"
#           house_tenants = Tenant.select{|tenant| tenant[:apartment_id] == apartment[:id]}
#           puts "Tenants:"
#           house_tenants.each{|tenant| puts "#{tenant.name}"}
#         end
#       end
#     end
# end
#
#   menu()

# binding.pry

# puts "ignore this line, it's just here so the binding.pry above works"
