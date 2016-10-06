require 'pry'
require 'active_record'
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"



puts "Welcome to Landlord CI"
# print out menu to user

# store user input to a var
puts "Can I help you? (press q to quit)"

choice = gets.chomp
while choice != "q" do
  p"Do you want to see a list of all apartments?"
  puts "yes or no"
  choice = gets.chomp
  if "yes".include? choice
    apartments_all = Apartment.all
    break
  else "q"
  end
end

get '/apartments' do
  @apartments = Apartment.all
erb :index
end

get 'apartments/new' do
  erb :new
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
erb :show
end


get '/apartements/1/tenants' do
end

get '/apartments/1/tenants/new' do
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartment"
end
