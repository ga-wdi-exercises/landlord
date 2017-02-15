require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

    while 1
      puts "Choose one of the following:"
      puts "1 - See all apartemnts"
      puts "2 - See all tenants"
      input = gets.chomp
      if (input == "1")
         Apartment.each do |apartments|
          puts "#{apartments.all}"
          end
      elsif (input == "2")
         Tenant.each do |tenants|
          puts "#{tenants.all}"
          end
      else
        puts "Invalid option."
      end
    end







# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."
#
# binding.pry
#
# puts "ignore this line, it's just here so the binding.pry above works"
