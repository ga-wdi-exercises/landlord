require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :"main/index"
end

#APARTMENTS
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end


put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

post '/apartments' do
  Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect '/apartments'
end

#TENANTS
get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do
  erb :"tenants/new"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

post '/tenants' do
  Tenant.create(params[:tenant])
  redirect '/tenants/:tenant'
end
#
# def wait
#     puts "*" * 80
# end
#
# def menu
#   puts "Please enter a number to begin or 'exit'"
#   puts "1) View all Properties"
#   puts "2) View all Tenants"
#   puts "3) View overview of properties and their tenants"
#   gets.chomp
# end
#
#
#   system "clear"
#   puts "Welcome to Allen Property Management"
#   wait
#
# menu_input = menu
# while menu_input != "exit"
#   if menu_input == "1"
#     system "clear"
#     puts "Your apartments:"
#     @apartments = Apartment.all
#     @apartments.each do |apartment|
#       puts apartment.address
#     end
#     puts "Press ENTER to continue"
#
#   elsif menu_input == "2"
#     system "clear"
#     puts "Your tenants:"
#     @tenants = Apartments.all
#     @tenants.each do |tenant|
#       puts tenant.name
#     end
#     puts "Press ENTER to continue"
#   elsif menu_input == "3"
#     system "clear"
#     puts "Your addresses: "
#     @apartments = Apartments.all
#     @apartments.each do |apartment|
#       puts apartment.address
#       puts "Residents:"
#       apartment_tenants = Tenants.select{|tenant| tenant.apartment_id == apartment.id}
#         puts "No occupants" if apartment_tenants.length == 0
#       apartment_tenants.each{|tenant| puts tenant.name}
#         wait
#     end
#   puts "Press ENTER to continue"
# end
# gets.chomp
#   system "clear"
#   puts (menu_input)
#   menu_input = menu
# end
