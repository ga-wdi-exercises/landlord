require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

while true
  puts "Good day, Mr. Pizza. What would you like to do?"
  puts "   1. List apartments"
  puts "   2. List tenants"
  puts "   3. List apartments with tenants"
  puts "   4. Quit"
  puts
  input = gets.chomp.to_i
  puts
  if input == 1
    Apartment.all.each do |apartment|
      puts "#{apartment.id}: #{apartment.address}, $#{apartment.monthly_rent}"
    end
  elsif input == 2
    Tenant.all.each{|tenant| puts "#{tenant.name}: #{tenant.age}"}
  elsif input == 3
    Apartment.all.each do |apartment|
      puts "Tenants living at #{apartment.address} ..."
      apartment.tenants.each do |tenant|
        puts "  #{tenant.name}"
      end
    end
  elsif input == 4
    break
  else
    puts "Please enter one of the numerals in the list."
  end
  puts
end
