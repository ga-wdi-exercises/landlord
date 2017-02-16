require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."

#had to look at the solution for this one ans worked collabrately with classmates.
x = 0
while x == 0 do
  puts "1 - See a list of all apartments"
  puts "2 - See a list of all tenants"
  puts "3 - See a list of all apartments and associated tenants"
  puts "0 - Exit out of menu choice"
  answer = gets.chomp.to_i
  case answer
  when 1
    Apartment.all.each do |apartment|
      puts "ID: #{apartment.id}, Address: #{apartment.address}, Rent: #{apartment.monthly_rent}"
    end
  when 2
    Tenant.all.each do |tenant|
      puts "Name: #{tenant.name}, Age: #{tenant.age}"
    end
  when 3
    Apartment.all.each do |apartment|
      puts "Address: #{apartment.address}\n"
      apartment.tenants.each do |tenant|
        puts "Name: #{tenant.name}\n"
      end
    end
  when 0
    break
  end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
