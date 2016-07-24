require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "Welcome to Landlord. Please choose an option:"
puts "1. Display a list of all apartments"
puts "2. Display a list of all tenants"
puts "3. Display a list of all apartments and their associated tenants"

user_choice = gets.chomp

if user_choice == '1'
  Apartment.all.each do |apartment|
    puts "Address :#{apartment.address} | Rent: $#{apartment.monthly_rent} | ID: #{apartment.id}"
  end
elsif user_choice == '2'
  Tenant.all.each do |tenant|
    puts "#{tenant.name}, #{tenant.age}"
  end
elsif user_choice == '3'
  Apartment.all.each do |apartment|
    apartment.tenants.each do |tenant|
      puts "#{apartment.address}, #{tenant.name}"
    end
  end
else
  puts "NOPE"
end
def fix_apt_id()
  new_id = 0
  Apartment.all.each do |apartment|
    apartment.id = new_id
    puts apartment.id
    new_id += 1
  end
  return nil
end



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
