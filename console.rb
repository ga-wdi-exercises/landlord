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


puts "Welcome Landlord!"
puts "For a list of apartments, press 1"
puts "For a list of tenants, press 2"
puts "For a list of apartments and tenants, press 3"
answer = gets.chomp
if answer.to_i == 1
  Apartment.all.each do |unit|
   puts "Appartments: ID: #{unit.id}, Address: #{unit.address}, Monthly Rent: #{unit.monthly_rent}"
 end
 elsif answer.to_i == 2
   Tenant.all.each do |individual|
     puts "Tenants: Name: #{individual.name}, Age: #{individual.age}, Gender: #{individual.gender}, Apartment: #{individual.apartment_id}"
   end
 elsif answer.to_i == 3
   Apartment.all.each do |unit|
     puts "Appartment ID: #{unit.id}. Address: #{unit.address}"
      unit.tenants.all.each do |person|
        puts "Tenant Name: #{person.name}, "
      end
   end
 end

# binding.pry



# puts "ignore this line, it's just here so the binding.pry above works"
