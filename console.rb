require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."


puts "ignore this line, it's just here so the binding.pry above works"

class Menu
  def initialize(tenant, apartment, number)
    attr_reader :tenant, :apartment
    @@tenant = tenant
    @@apartment = apartment
    @@number = number

  end

  def self.display
    while 1
      puts "Choose one of the following:"
      puts "1 - List of All Apartments"
      puts "2 - List of All Tenants"
      puts "3 - List of All Apartments and Associated Tenants"
      @@input = gets.chomp
      if ["1","2","3"].include? @@input
        self.select @@input
        break
      else
        puts "Invalid option."
      end
    end
  end
  def self.select number
    puts "You selected #{number}"
    all_tenants = Tenant.all
    all_apartment = Apartment.all
      if @@input == "1"
        all_apartment.each do |i|
          puts "id: #{i[:id]} Address: #{i[:address]} Monthly rent: #{i[:monthly_rent]}"
        end
        self.display
      end
      if @@input == "2"
        all_tenants.each do |i|
          puts "Name: #{i[:name]} Age: #{i[:age]}"
        end
        self.display
      end
      if @@input == "3"
        all_apartment.each do |i|
          puts "Address: #{i[:address]} Apartment id: #{i[:name]}"
        end
        #self.display
      end
    end
  end

Menu.display

binding.pry
