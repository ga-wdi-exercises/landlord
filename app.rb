require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment"
require_relative "models/tenant"

def landlord_clapp
  puts "Hello Landlord. Type 'tenant' or 'apartment' to create new:"
  type = gets.chomp
  if type == 'apartment'
    create_apartment
  elsif type == 'tenant'
    create_tenant
  else
    puts "I'm sorry, I don't understand your input."
    landlord_clapp
  end
end

def create_apartment
  puts "What is the apartment address?"
  address = gets.chomp
  puts "What is the apartment's rent?"
  monthly_rent = gets.chomp
  puts "What is the apartment's square footage?"
  sqft = gets.chomp
  puts "How many bedrooms?"
  num_beds = gets.chomp
  puts "How many bathrooms?"
  num_baths = gets.chomp

  new_apartment = Apartment.create(address: address, monthly_rent: monthly_rent.to_i, sqft: sqft.to_i, num_beds: num_beds.to_i, num_baths: num_baths.to_i)
  puts "You have created a new apartment at the address " + new_apartment.address
  # "New apartment id: " + new_apartment.id.to_s
  add_another
end

def create_tenant
  puts "What is the tenant's full name?"
  name = gets.chomp
  puts "What is the tenant's age?"
  age = gets.chomp
  puts "What is the tenant's gender?"
  gender = gets.chomp

  new_tenant = Tenant.create(name: name, age: age.to_i, gender: gender)
  puts "You have created a new tenant named " + new_tenant.name
  # "New tenant id: " + new_tenant.id.to_s
  add_another
end

def add_another
  puts "Would you like to add more? Type 'yes' or 'quit'"
  input = gets.chomp
  if input == 'yes'
    landlord_clapp
  else
    "Thank you. Goodbye." #is there actually any need to have an else?
  end
end

# binding.pry

landlord_clapp
