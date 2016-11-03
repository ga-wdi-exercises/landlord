require "active_record"
require "pry"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"

loop {
  puts "Welcome, Bob. Property Management Menu"
  puts "1 - View All Apartments"
  puts "2 - View All Tenets"
  puts "3 - View all Apartments "
  puts "0 - Exit the Program"
  option = gets.chomp.to_i
  break if option == 0
  if option == 1
    puts Apartment.all.inspect
  elsif option == 2
    puts Tenant.all.inspect
  elsif option == 3
    Apartment.all.each { |apartment|
      puts apartment.inspect
      apartment.tenants.each { |tenant|
        puts tenant.inspect
      }
    }
  else
    puts "Unrecognized Option: #{option}"
  end
}
