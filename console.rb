require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

def menu
  puts "*" * 25
  puts "Welcome to ApartmentLandlord version 2.1.1! What would you like to do?"
  puts "To see a list of all apartments, type '1'."
  puts "To see a list of all tenants, type '2'."
  puts "To see a list of all apartments and their associated tenants, type '3'."
  puts "To create a tenant, press '4'."
  puts "To create an apartment, press '5'."
  puts "To exit, type '6'."
end


def show_all_apartments
  Apartment.all.each do |apt|
    puts "#{apt.address} has #{apt.num_beds} beds and #{apt.num_baths} baths at $#{apt.monthly_rent}"
  end
end

def show_all_tenants
  Tenant.all.each do |tenant|
    puts "#{tenant.name} is #{tenant.age} years old, and is #{tenant.gender}"
  end
end

def show_all_ten_and_apt
  Apartment.all.each do |apt|
    puts "This is the apartment: #{apt.address}"
    puts "These are the tenants: #{apt.tenants}"
  end
end

def create_ten
  puts "What is the tenants name?"
  t_name = gets.chomp
  puts "What is the tenants age?"
  t_age = gets.chomp
  puts "What is the tenants gender?"
  t_gender = gets.chomp
  puts "What is the apartment ID?"
  t_apt_id = gets.chomp
  new_dude = Tenant.create(name: t_name, age: t_age.to_i, gender: t_gender, apartment_id: t_apt_id.to_i);
  puts "Here is your new tenant"
  puts new_dude.inspect
end

def create_apt
  puts "What is the apartments address?"
  a_address = gets.chomp
  puts "What is the monthly rent"
  a_rent = gets.chomp
  puts "What is the square feet?"
  a_feet = gets.chomp
  puts "What is the number of beds?"
  a_beds = gets.chomp
  puts "What is the number of baths?"
  a_baths = gets.chomp
  new_apt = Apartment.create(address: a_address, monthly_rent: a_rent.to_i, sqft: a_feet.to_i, num_beds: a_beds.to_i, num_baths: a_baths.to_i);
  puts "Here is your new apartment"
  puts new_apt.inspect
end


input = nil;
while input != "6"
  menu
  input = gets.chomp
  if input == "1"
    show_all_apartments
  elsif input == "2"
    show_all_tenants
  elsif input == "3"
     show_all_ten_and_apt
  elsif input == "4"
    create_ten
  elsif input == "5"
    create_apt
  elsif input == "6"
    puts "Thanks for using ApartmentLandlord!"
  end
end
