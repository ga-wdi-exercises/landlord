require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working
puts ""
puts "Welcome to GoodLordy the app for landlords"
reply = ""
while reply != "4"
  puts ""
  puts "Enter 1 to see a list of apartments."
  puts "Enter 2 to see a list of tenants."
  puts "Enter 3 to see a list of apartments with associated tenants"
  puts "Enter 4 to quit"
  reply = gets.chomp
  if reply == "1"
    puts ""
    all_apartments = Apartment.all
    all_apartments.each do |apt|
      puts "ID: #{apt.id}, Address : #{apt.address}, Rent : #{apt.monthly_rent}"
    end
  elsif reply == "2"
    puts ""
    all_tenants = Tenant.all
    all_tenants.each do |tenant|
      puts "Name: #{tenant.name}, Age: #{tenant.age}"
    end
  elsif reply == "3"
    Apartment.all.each do |apt|
      puts ""
      puts "Address : #{apt.address}"
      puts "Tenants : "
      tenArry = apt.tenants
      tenArry.each do |ten|
        puts "#{ten.name}"
      end
    end

  end

end
# binding.pry
puts "Goodbye"
