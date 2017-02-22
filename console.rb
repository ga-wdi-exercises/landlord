require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging


require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

def menu
  puts " ***** " * 8
  puts "Welcome to LANDLORD. What would you like to do?"
  puts "1 to see a list of all properties,"
  puts "2 to see a list of all tenants,"
  puts "3 to see a list of all apartments and their tenants,"
  puts "4 to create a new tenant,"
  puts "5 to create a new property."
  puts "Input 6 to exit."
end

 def show_all_apartments
   Apartment.all.each do |apt|
     puts "#{apt.address}: #{apt.num_beds} bedrooms and #{apt.num_baths} baths at $#{apt.monthly_rent} per month."
   end
 end

 def show_all_tenants
   Tenant.all.each do |tenant|
     puts "#{tenant.name}, #{tenant.gender}, #{tenant.age} years old."
   end
 end

 def tenants_w_apts
   Apartment.all.each do |apt|
     puts "Apartment: #{apt.address}"
     puts "Tenants: #{apt.tenants}"
   end
 end

 def create_tenant
   puts "What is the new tenant's name?"
   new_name = gets.chomp
   puts "What is the new tenant's age?"
   new_age = gets.chomp
   puts "What is the new tenant's gender?"
   new_gender = gets.chomp
   puts "What is the apartment id?"
   new_apt_id = gets.chomp
   new_occ = Tenant.create(name: new_name, age: new_age.to_i, gender: new_gender, apartment_id: new_apt_id.to_i);
   puts "Here is your new tenant"
   puts new_occ.inspect
 end

 def create_apt
   puts "What is the new property's address?"
   new_address = gets.chomp
   puts "What is the new property's monthly rent?"
   new_rent = gets.chomp
   puts "Input the square footage of the new property."
   sqfeet = gets.chomp
   puts "Input the number of bedrooms."
   new_beds = gets.chomp
   puts "Input the number of bathrooms."
   new_baths = gets.chomp
   new_apt = Apartment.create(address: new_address, monthly_rent: new_rent.to_i, sqft: sqfeet.to_i, num_beds: new_beds.to_i, num_baths: new_baths.to_i);
   puts "Here's your new property:"
   puts new_apt.inspect
 end

 input = nil;
 while input != "6"
   menu
   input = gets.chomp
   if input == "1"
     show_all_apartments
   elsif input == "2"
     show_all_tenants
   elsif input == "3"
      tenants_w_apts
   elsif input == "4"
     create_tenant
   elsif input == "5"
     create_apt
   elsif input == "6"
     puts "Thanks for using LANDLORD"
   end
 end
#print "Input 1 for apartment list, 2 for tenants. Enter 'quit' to exit.\n"
#
# landlord = gets.chomp
#
# while landlord != "quit"
#
#   if landlord == "1"
#     #shows all apartments
#     Apartment.all.each do |apt|
#       puts apt[:address]
#     end
#   elsif landlord == "2"
#
#     #shows all tenants
#     Tenant.all.each do |tenant|
#       puts tenant[:name]
#     end
#
#   else
#     puts "Please enter a 1 or 2 to view property or tenant information, or 'quit' to exit."
#
#     # break if landlord == "quit"
#   end
#     puts "Enter 1 or 2"
#     landlord = gets.chomp
#   end

# puts "press <enter> to continue"

  # end
  #

# # NOTE: Uncomment the lines below to verify that your seed script is working
#
# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
