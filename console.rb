require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

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


puts "Welcome to the Landlord app!"
puts "Press 1 for a list of your apartments.  Press 2 for a list of your tenants.  Press 3 to see who lives where."
user_input = gets.chomp.to_i
if (user_input == 1)
  puts Apartment.all
end
elsif (user_input == 2)
  puts Tenant.all
end
elsif (user_input == 3)
     puts Tenant.where(apartment_id == Apartment(id))
end
end




binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
