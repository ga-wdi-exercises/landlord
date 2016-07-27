require "pry"

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

binding.pry

# puts "ignore this line, it's just here so the binding.pry above works"
puts "Please select from the following list of options"
puts "1) View all Apartments"
puts "2) Veiw all Tenants"
puts "3) View all Apartments and there associated Tenants"

response = gets.chomp
#I'm really stuck here guys.  Not sure where to move forward.  This is the work that I have completed.
# Everything I have tried is not working.  I guess I'll just meet up with someone during office hours to complete this part.
