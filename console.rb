require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

require "pg" # postgres db library
require "active_record" # the ORM
require "pry"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."


# Build out a simple command line interface that provides a menu prompt and allows the user to:

# See a list of all apartments (include ID#, address, and monthly rent)
def all_apartments
  puts "List of Properties"
  Apartment.all.each do |apartment|
    puts "ID: #{apartment.id}, Address: #{apartment.address}, \tRent Price: #{apartment.monthly_rent}"
  end
end

# See a list of all tenants (include name and age)
def all_tenants
  puts "List of Tenants"
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, Age: #{tenant.age}"
  end
end

# See a list of all apartments and their associated tenants (just address and name)
def all_apts_tenants
  puts "List of Apartments and Tenants"
  Apartment.all.each do |apartment|
    puts "#{apartment.address} and #{apartment.tenants.inspect}"
  end
end





# binding.pry

# puts "ignore this line, it's just here so the binding.pry above works"

puts "Welcome to your property database. "

input = nil
while input !="4"

  puts "Type 1 if you'd like to see a list of properties."
  puts "Type 2 if you'd like to see a list of tenants."
  puts "Type 3 if you'd like to see a list of apartments and tenants."
  puts "Type 4 if you'd like to exit the program."
  input = gets.chomp
  if input =="1"
    all_apartments
    puts "+" * 80
    puts "What would you like to do next?"
  elsif input == "2"
    all_tenants
    puts "+" * 80
    puts "What would you like to do next?"

  elsif input =="3"
    all_apts_tenants
    puts "+" * 80
    puts "What would you like to do next?"
  else input =="4"
  end

end
