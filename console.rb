require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."

# binding.pry
#
# puts "ignore this line, it's just here so the binding.pry above works"


# ruby_apartments = apartments.map do |apartment|
#   Apartment.new(apartment[:id], apartment[:address], apartment[:monthly_rent], apartment[:square_feet])
# end
#
# ruby_tenants = tenants.map do |tenant|
#   Tenant.new(tenant[:id], tenant[:name], tenant[:age], tenant[:apartment_id])
# end
puts "*" * 50
puts "Hello welcome to this app."
puts "Type '1' to view all of your apartments"
puts "Type '2' to view all of your tenants"
puts "Type '3' to view all of your tenants"
track_number = gets.chomp
if track_number == "1"
  puts apartments
elsif track_number == "2"
  puts tenants
elsif track_number == "3"
  #trying to figure out the code that goes here
else
  puts "Hello welcome to this app."
  puts "Type '1' to view all of your apartments"
  puts "Type '2' to view all of your tenants"
  puts "Type '3' to view all of your tenants"
end
