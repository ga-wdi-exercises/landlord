require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working
#
# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."
#
# the_bat_cave = Apartment.create(address: "123 Main St", monthly_rent: 2000, sqft: 600, num_beds: 2, num_baths: 1)
# me = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment: the_bat_cave)


puts "Landlord App"

def main_menu
  puts "*********MAIN MENU*********"
  puts "1) List of Apartments"
  puts "2) List of Tenants"
  puts "3) List of Apartments with their Tenants"
  puts "Exit"

  input = gets.chomp
end

input = main_menu

while input != 'exit'
  if input == "1"
    puts "List of Apartments:"
      Apartment.all.each do |apartment|
        puts "APARTMENT: #{apartment.id}, ADDRESS:#{apartment.address}, RENT: #{apartment.monthly_rent}"
    end
    puts "PRESS ENTER TO GO BACK TO THE MAIN MENU"

  elsif input == "2"
    puts "List of Tenants:"
      Tenant.all.each do |tenant|
        puts "TENANT: #{tenant.name}, AGE: #{tenant.age}"
      end
      puts "PRESS ENTER TO GO BACK TO THE MAIN MENU"
    elsif input == "3"
      puts "List of Apartments with their Tenants:"
        Apartment.all.each do |apartment|
          puts "APARTMENT: #{apartment.address}"
          apartment.tenants.each do |tenant|
            puts "TENANT: #{tenant.name}"
        end
      end
        puts "PRESS ENTER TO GO BACK TO THE MAIN MENU"
    end


  gets.chomp
  input = main_menu
end


binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
