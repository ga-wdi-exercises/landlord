require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

puts "Welcome, please select 'a' to see your apartment listings, 'b' to see your tenant listings, or 'c' to see apartments and associated tenants."

answer = gets.chomp

if answer == "a"
  Apartment.all.each do |apartment|
    puts "ID: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: $#{apartment.monthly_rent}"
  end
elsif answer == "b"
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, Age: #{tenant.age}"
  end
elsif answer == "c"
  Apartment.all.each do |apartment|
    puts "Address: #{apartment.address}"
 end
end

#need to get this last one to work porperly!




binding.pry

#puts "ignore this line, it's just here so the binding.pry above works"
