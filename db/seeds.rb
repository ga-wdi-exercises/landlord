require "bundler/setup" #
require "pg"
require "active_record"
require "pry"
require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"
Tenant.destroy_all
Apartment.destroy_all


Apartment.new(address: "26 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)
Apartment.new(address: "27 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)
Apartment.new(address: "28 Victory Lane", monthly_rent: 900, sqft: 567, num_beds: 3, num_baths: 2)

Tenant.new(name: "John", age: 20, gender: "male")
Tenant.new(name: "Kara", age: 21, gender: "female")
Tenant.new(name: "Susan", age: 22, gender: "female")
Tenant.new(name: "Tia", age: 25, gender: "female")
Tenant.new(name: "Tamara", age: 25, gender: "male")
Tenant.new(name: "Cathy", age: 40, gender: "female")
Tenant.new(name: "George", age: 30, gender: "male")
Tenant.new(name: "Lady", age: 50, gender: "female")

class Menu
  def self.display
    while 1
      puts "Choose one of the following:"
      puts "1 - See all apartemnts"
      puts "2 - See all tenants 2"
      input = gets.chomp
      if (input = 1)
        Apartments.all
      if (input = 2)
        Tenants.all
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

    # while 1 do
    #   puts "Choose one of the following:"
    #   puts "1 - See all properties"
    #   puts "2 - See all tenants"
    #   # puts "3 - See all apartments and current residents"
    #   input = gets.chomp
    #   if input = 1
    #     puts Apartments.all
    #   elsif input = 2
    #     puts Tenants.all
    #   # elsif input = 2
    #   #   puts Tenants.all
    #   else
    #     puts "Invalid option."
    #   end
    # end



binding.pry
