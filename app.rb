require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

# require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
# require_relative "models/apartment"
# require_relative "models/tenant"

apartments = [
  {id: 1, address: '2805 Arlington Blvd', monthly_rent: 1550, sqft: 1000, num_beds: 1, num_baths: 1},
  {id: 2, address: '1401 N Taft St', monthly_rent: 1750, sqft: 990, num_beds: 1, num_baths: 1},
  {id: 3, address: '1824 Irving Street NW', monthly_rent: 2500, sqft: 1800, num_beds: 3, num_baths: 1}
]

tenants = [
  {id: 1, name: "Kristin Wisoky", age: 24, gender: "Female", apartment_id: 1},
  {id: 2, name: "Hilbert Effertz", age: 31, gender: "Male", apartment_id: 1},
  {id: 3, name: "Dangelo Bogisich", age: 61, gender: "Female", apartment_id: 2},
  {id: 4, name: "Aurelia Harvey", age: 36, gender: "Female", apartment_id: 3},
  {id: 5, name: "Enola Sauer", age: 32, gender: "Female", apartment_id: 3}
]

get '/' do
 erb :index
end

get '/apartments' do
  @apartments = apartments
  @tenants = tenants
  erb :apartments
end

get '/apartments/:id' do
  @hash = params[:id].to_i - 1
  @apartments = apartments
  @tenants = tenants
  erb :apartment
end

post '/apartments' do
  @id = params[:id]
  @tenants = tenants
  redirect "apartments/:id"
end

get '/apartments/:id/tenants' do
 erb :tenants
end

get '/apartments/:id/tenants/new' do
  erb :new_tenant
end

get '/apartments/new' do
  erb :new_apartment
end




# def landlord_clapp
#   puts "Hello Landlord. Type 'tenant' or 'apartment' to create new:"
#   type = gets.chomp
#   if type == 'apartment'
#     create_apartment
#   elsif type == 'tenant'
#     create_tenant
#   else
#     puts "I'm sorry, I don't understand your input."
#     landlord_clapp
#   end
# end
#
# def create_apartment
#   puts "What is the apartment address?"
#   address = gets.chomp
#   puts "What is the apartment's rent?"
#   monthly_rent = gets.chomp
#   puts "What is the apartment's square footage?"
#   sqft = gets.chomp
#   puts "How many bedrooms?"
#   num_beds = gets.chomp
#   puts "How many bathrooms?"
#   num_baths = gets.chomp
#
#   new_apartment = Apartment.create(address: address, monthly_rent: monthly_rent.to_i, sqft: sqft.to_i, num_beds: num_beds.to_i, num_baths: num_baths.to_i)
#   puts "You have created a new apartment at the address " + new_apartment.address
#   # "New apartment id: " + new_apartment.id.to_s
#   add_another
# end
#
# def create_tenant
#   puts "What is the tenant's full name?"
#   name = gets.chomp
#   puts "What is the tenant's age?"
#   age = gets.chomp
#   puts "What is the tenant's gender?"
#   gender = gets.chomp
#
#   new_tenant = Tenant.create(name: name, age: age.to_i, gender: gender)
#   puts "You have created a new tenant named " + new_tenant.name
#   # "New tenant id: " + new_tenant.id.to_s
#   add_another
# end
#
# def add_another
#   puts "Would you like to add more? Type 'yes' or 'quit'"
#   input = gets.chomp
#   if input == 'yes'
#     landlord_clapp
#   else
#     "Thank you. Goodbye." #is there actually any need to have an else?
#   end
# end

# binding.pry

# landlord_clapp
