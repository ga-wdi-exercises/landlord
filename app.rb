require "bundler/setup"
# require 'sinatra'
# require 'sinatra/reloader'
require 'active_record'
require "pg"

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/tenant'
require_relative 'models/apartment'

def start
puts "Welcome, landlord! How can I help you today?"
puts "*" * 40
puts "- For a list of your appartments type 1"
puts "- For a list of your tenants type 2"
puts "- For a list of all apartments and their associated tenants type 3"
user_input = gets
  if user_input.to_i == 1
    Apartment.all.each do |unit|
      puts "Appartment ID: #{unit.id}, Address: #{unit.address}, Monthly Rent: #{unit.monthly_rent}"
    end
    start
  elsif user_input.to_i == 2
    Tenant.all.each do |person|
      puts "Tenant Name: #{person.name}, Age: #{person.age} years"
    end
    start
  elsif user_input.to_i == 3
    Apartment.all.each do |unit|
      puts "Appartment ID: #{unit.id}. Address: #{unit.address}"
      unit.tenants.all.each do |person|
        puts "Tenant Name: #{person.name}, "
      end
    end
    start
  else
    puts "Sorry I didn't understand this!"
    start
  end
end
start

# binding.pry
