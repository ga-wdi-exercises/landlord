require_relative "db/connection"
require_relative "models/apartment"


puts "Hello! Welcome to Property Manager CLI."
puts "Enter '1' to View Apartments"
puts "Enter '2' to View Tenants"
puts "Enter '3' to Apartments and Associated Tenants"
user_input = gets.chomp

if user_input == "1"
  puts Apartment.all
end
