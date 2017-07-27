require 'pry'
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

in_use = true

while in_use do
  puts 'Slum Management'
  puts 'What do you want to do:'
  puts '[1] See all apartments'
  puts '[2] See all tenants'
  puts '[3] See all apartments with their tenants'
  puts 'press any other key to exit'
  answer = gets.chomp
  if answer == '1'
    puts '**All Apartments**'
    apartments = Apartment.all
    apartments.each{|apt| puts "- ID: #{apt.id}, ADDRESS: #{apt.address}, RENT: $#{apt.monthly_rent}"}
    puts '******************'
  elsif answer == '2'
    puts "------TENANTS------"
    tenants = Tenant.all
    tenants.each do |t|
      puts "NAME: #{t.name}, AGE: #{t.age}"
    end
  elsif answer == "3"
    apartments = Apartment.all
    apartments.each do |apt|
      tenants = []
      apt.tenants.each do |ten|
        tenants << ten.name
      end
      if tenants.length >=1
        puts "Apartment \##{apt.id} at #{apt.address} is occupied by:\n #{tenants.join(", ")}\n\n"
      else
        puts "!!!! Apartment \##{apt.id} at #{apt.address} is VACANT !!!!\n\n"
    end
end
  elsif answer == "4"
    open = false
  else
    puts "Unrecognized command"
    break
  end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
