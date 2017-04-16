require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working
#
# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

puts "Select from the choices bellow:"
puts "Type '1' for a list of apartments"
puts "Type '2' for a list of tenants"

selection = gets.chomp.to_i

if selection == 1
  Apartment.all.each do |apartment|
    puts "ID: #{apartment.id}, address: #{apartment.address}, monthly rent: #{apartment.monthly_rent}"
  end
elsif selection == 2
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, age: #{tenant.age}"
  end
end








binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
