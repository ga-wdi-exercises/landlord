require "bundler/setup"
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment"
require_relative "models/tenant"

puts "Hello Bob. How are you today?"
while gets.chomp != "fine"
  puts "Just tell me what I want to hear."
end
puts "Glad you decided to play ball. Your usual menu: \n
Type 1 to overview all the apartments, type 2 to overview the tenants.\n
Type 3 to view all the apartments with their tenants."

user_input = gets.chomp

case user_input
when "1"
 Apartment.all.each {|a| puts a.address}
when "2"
 Tenant.all.each {|t| puts "Name: #{t.name}, Age: #{t.age}"}
when "3"
  Apartment.all.each do |a|
    puts "Apartment: #{a.address}, Tenants:"
    a.tenants.each do |t|
      puts "#{t.name}"
    end
  end
end


puts "Anything else I can help you with?"

binding.pry





puts "end of application"
