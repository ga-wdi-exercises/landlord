require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

require 'active_record'

input = ''

while input != 'exit'

  puts 'Enter 1 to see a list of all apartments'
  puts 'Enter 2 to see a list of all tenants'
  puts 'Enter 3 to see all apartments and their tenants'
  puts 'Type exit to end application'

  input = gets.chomp

  case input

    when '1'
      Apartment.all.each do |place|
        puts "ID: #{place.id} Address: #{place.address} Rent: #{place.monthly_rent}"
      end


    when '2'
      Tenant.all.each do |person|
        puts "Name: #{person.name} Age: #{person.age}"
      end

    when '3'
      Apartment.all.each do |place|
        puts 'Address ' + place.address
        place.tenants.each do |person|
          puts 'Tenant Name : ' + person.name
        end
      end
    end


  end
