require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

#puts "There are #{Apartment.count} apartments"
#puts "There are #{Tenant.count} tenants"

#puts "*" * 50

#puts "The first apartment is at #{Apartment.first.address}."
#puts "It has  #{Apartment.first.tenants.count} tenants."

def apartment_callbox
puts "Press 1 for apartments."
puts "Press 2 for tenants."
puts "Press 3 for apartments and tenants"
end

answer = gets.chomp


if apartment_callbox == 1
  Apartment.each do |apartment|
   puts "Apartments: ID: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: #{apartment.monthly_rent}"
 end

 elsif apartment_callbox == 2
   Tenant.each do |tenant|
     puts "Tenants: Name: #{tenant.name}, Age: #{tenant.age}, Gender: #{tenant.gender}, Apartment: #{tenant.apartment_id}"
   end

 elsif apartment_callbox == 3
   Apartment.each do |apartment|
     puts "Apartment ID: #{tenant.id}. Address: #{tenant.address}"
      apartment.tenants.each do |tenant|
        puts "Tenant Name: #{person.name}"
      end
end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
