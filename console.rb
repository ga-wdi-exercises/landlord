require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging



# Build out a simple command line interface that provides a menu prompt and allows the user to:
#
# See a list of all apartments (include ID#, address, and monthly rent)
# See a list of all tenants (include name and age)
# See a list of all apartments and their associated tenants (just address and name)

puts "Welcome to your landlord interface. Type '1' to see all apartments, '2' to see all tenants, or '3' to see a list of apartments with their associate tenants"
response = gets.chomp

if response == 1.to_s
  Apartment.all.each do |apartment|
    puts "ID: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: #{apartment.monthly_rent} "
  end
elsif response == 2.to_s
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, Age: #{tenant.age}"
  end
elsif response == 3.to_s
  Apartment.all.each do |apartment|
    apartment.tenants.each do |tenant|
      puts "Apartment: #{apartment.address}, Tenants: #{tenant.name} ... age: #{tenant.age}"
    end
  end
else
  puts "Invalid number. Goodbye"
end



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
