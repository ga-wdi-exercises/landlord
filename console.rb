require 'active_record'
require 'pg'
require 'pry'
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."

puts "Hello, please enter ...\n
      1. to see a list of all apartments\n
      2. to see a list of all tenants \n
      3. to see a list of all apartments and their tenants"
    input = gets.chomp
      if input == "1"
        Apartment.all.each do |apartment|
          puts "apartment id: #{apartment.id}"
          puts "apartment address: #{apartment.address}"
          puts "monthly rent: #{apartment.monthly_rent}"
        end
      elsif input == "2"
        Tenant.all.each do |tenant|
          puts "tenant name: #{tenant.name}"
          puts "tenant age: #{tenant.age}"
        end
      elsif input == "3"
        Apartment.all.each do |apartment|
            puts apartment.address
            apartment.tenants.each do |tenant|
              puts tenant.name
            end
          end
        end




binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
