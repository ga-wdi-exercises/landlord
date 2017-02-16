require 'active_record'
require 'pry'
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "Greetings, elite ruler of the serfs! What would you like to do?
  Enter 1 to see all apartments.
  Enter 2 to see all tenants.
  Enter 3 to see all apartment addresses and the tenants who live there."
user_input = gets.chomp
if user_input == "1"
  Apartment.all.each do |apt|
    puts "ID = #{apt.id}, Address=#{apt.address}, Rent=#{apt.monthly_rent}"
  end
end

if user_input == "2"
  Tenant.all.each do |tnt|
    puts "Name = #{tnt.name}, Age=#{tnt.age}"
  end
end

if user_input == "3"
  Apartment.all.each do |apt|
    if Tenant.where(apartment_id: apt.id) == []
    puts "#{apt.address}; Tenants: none"
    else
    Tenant.where(apartment_id: apt.id).find_each do |tnt|
    puts "#{apt.address}; Tenants: #{tnt.name}"
    end
  end
end
end



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
