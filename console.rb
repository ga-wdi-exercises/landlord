require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging


require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# binding.pry

print "Input 1 for apartment list, 2 for tenants. Enter 'quit' to exit.\n"

landlord = gets.chomp

while landlord != "quit"

  if landlord == "1"
    #shows all apartments
    Apartment.all.each do |apt|
      puts apt[:address]
    end
  elsif landlord == "2"

    #shows all tenants
    Tenant.all.each do |tenant|
      puts tenant[:name]
    end

  else
    puts "Please enter a 1 or 2 to view property or tenant information, or 'quit' to exit."

    # break if landlord == "quit"
  end
    puts "Enter 1 or 2"
    landlord = gets.chomp
  end

  # puts "press <enter> to continue"

  # end
  #

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

# binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
