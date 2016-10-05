require "pry"
require "bundler/setup"
require "pg" # postgres db library
require "active_record" # the ORM


require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."


class Menu
  def self.display
    while 1
      puts "Choose one of the following:"
      puts "1 - List of all apartment ID#, address and monthly_rent"
      puts "2 - List of all tenants name and age"
      puts "3 - Address and name of all associated tenants"
      input = gets.chomp
      if ["1","2","3"].include? input
        self.select input
        break
      else
        puts "Invalid option."
      end
    end
  end
  def self.select number
    puts "You selected #{number}"
  end
end

Menu.display

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
