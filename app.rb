require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

puts "Welcome to Landlord! what would you like to do?"
puts "1. See a list of all apartments which include ID#, address, and monthly rent."
puts "2. See a list of all tenants which include name and age."
puts "3. See a list of all apartments and their associated tenants just address and name"

user_input = gets.chomp

if user_input == "1"
    all_apartments = Apartment.all
    all_apartments.each do |apt|
        puts "=" * 20
        puts "ID: #{apt.id}"
        puts "Address: #{apt.address}"
        puts "Monthly_rent: #{apt.monthly_rent}"
        puts "=" * 20
    end
elsif user_input == "2"
    all_tenants = Tenant.all
    all_tenants.each do |tenant|
        puts "=" * 20
        puts "Name: #{tenant.name}"
        puts "Age: #{tenant.age}"
        puts "=" * 20
    end
elsif user_input == "3"
    Aparment.all.each do |apt|
        puts "=" * 20
        puts "Address: #{apt.address}"
        tenants = apt.tenants
        tenants.each do |tenant|
            puts "  " + tenant.name
        end
        puts "=" * 20
    end
end
