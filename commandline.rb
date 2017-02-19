require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg"
require "active_record"
require "pry"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection.rb"

print "Are you adding another address?"
user_input = gets.chomp
user_input = user_input.upcase
if user_input == "YES"
  print "What's the address?"
  current_address = gets.chomp.to_s
  print "What is your monthly_rent?"
  current_rent = gets.chomp.to_i
  print "How many square feet?"
  square_feet = gets.chomp.to_i
  print "How many bedrooms?"
  bedrooms = gets.chomp.to_i
  print "How many bathrooms?"
  bathrooms = gets.chomp.to_i
  new_apartment = Apartment.create(address: current_address, monthly_rent: current_rent, sqft: square_feet, num_beds: bedrooms, num_baths: bathrooms)
end
