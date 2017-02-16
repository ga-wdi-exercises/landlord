require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."



user_input = nil

loop do
  puts "Choose an option"
  puts "*" * 50
  puts "1: See all apartments"
  puts "2: See all tenants"
  puts "3: See all apartments and their tenants"
  puts "0: Exit program"
  user_input = gets.chomp.to_i
  break if user_input == 0
  if user_input == 1
    Apartment.all.each do |apartment|
      puts "ID: #{apartment.id}, Address: #{apartment.address}, Rent: $#{apartment.monthly_rent}"
    end
  end
  if user_input == 2
    Tenant.all.each do |tenant|
      puts "Name: #{tenant.name}, Age: #{tenant.age}"
    end
  end
  if user_input == 3
    Apartment.all.each do |apartment|
     puts apartment.address
      Tenant.all.each do |tenant|
        if tenant.apartment_id == apartment.id
          puts "Name: #{tenant.name}"
        end
      end
   end
  end
end

puts "ignore this line, it's just here so the binding.pry above works"
