# require "sinatra"
# require "sinatra/reloader"
require "active_record"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"
puts "Please enter the following number to view the informations"
puts "1 --- all apartments(ID, address, and monthly_rent)"
puts "2 --- all tenants (name and age)"
puts "3 --- all apartments and their associated tenants(address and name)"
puts "4 --- exit"
user_input = gets.chomp.to_i
if user_input == 1
  Apartment.all.each do |apt|
  puts "#{apt.id}, #{apt.address}, #{apt.monthly_rent}"
end

elsif user_input == 2
  Tenant.all.each do |tenant|
    puts "#{tenant.name}, #{tenant.age}"
  end
elsif user_input ==3
  Apartment.all.each do |apt|
    apt.each do |tenant|
    # apt.each do |tenant|
      puts apt.address
      puts apt.name#{apt.address}
  #  puts #{tenant.name}"
  end
  end
end
