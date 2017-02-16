require "pry"
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'


puts "Welcome to my Apartments"

active_apartment = false

while active_apartment = true
  puts "Enter 1 to view all apartments"
  puts "Enter 2 to view all tenants"
  puts "Enter 3 to see where they live"

  input = gets.chomp.to_i
  if input == 1
    puts "List of Apartments"
    Apartment.all.each do |apartment|
      puts "ID: #{apartment.id} Address: #{apartment.address} Rent #{apartment.monthly_rent}"
      puts "*" * 50

    end

  end
  if input == 2
    puts "List of Tenants"
    Tenant.all.each do |tenant|
      puts "Name: #{tenant.name}, Age: #{tenant.age}"
      puts "*" * 50
    end

  end
  if input == 3
    puts "Apartments and their Tenants:"
    Apartment.all.each do |apartment|
      puts apartment.address

      apartment.tenants.each do |tenant|
        puts tenant.name

      end
      puts "*" * 50
    end
  end
end








binding.pry
