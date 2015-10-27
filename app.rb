require 'active_record'
require 'pry'

require_relative 'models/apartment'
require_relative 'models/tenant'
require_relative 'config/db.rb'

def get_input(prompt)
  puts prompt
  return gets.chomp
end

def buffer
  "************************************"
end

def main_menu
  puts "Hello! Welcome to Landlord, your commandline tool to help organize your property!"
  puts buffer
  puts "Menu"
  puts buffer
  puts "1) View All Apartments"
  puts "2) View All Tenants"
  puts "3) Create Apartment"
  puts "4) Create Tenant"
end

def create_apartment
  address = get_input("What is the address?")
  monthly_rent = get_input("What is the monthly rent?")
  sqft = get_input("What is the square footage?")
  num_beds = get_input("How many bedrooms are there?")
  num_baths = get_input("How many bathrooms are there?")
  {address: address, monthly_rent: monthly_rent.to_i, sqft: sqft.to_i, num_beds: num_beds.to_i, num_baths: num_baths.to_i}
end

def create_tenant
  name = get_input("What is the tenants name?")
  age = get_input("What is the tenants age?")
  gender = get_input ("What is the tenants gender?")
  {name: name, age: age.to_i, gender: gender.to_i}
end

in_menu = true
while in_menu
  main_menu
  choice = get_input("Please choose 1-4 or \"q\" to quit")
  if choice == "1"
    puts buffer
    puts "Here are all the apartments addresses"
    puts buffer
    Apartment.all.each do |apartment|
      puts apartment.address
    end
  elsif choice == "2"
    puts buffer
    puts "Here are all of your tenants names"
    puts buffer
    Tenant.all.each do |tenant|
      puts tenant.name
    end
  elsif choice == "3"
    Apartment.create(create_apartment)
  elsif choice == "4"
    Tenant.create(create_tenant)
  elsif choice == "q"
    puts "Goodbye!"
    in_menu = false
  end
end
