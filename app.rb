require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
@aparments = Apartment.find(params[:id])
erb :"apartments/show"
end

get '/' do
  redirect "/apartments"
end
















#####################################################################
                      #CODE FOR CLI APP
#####################################################################
# puts "Hello! Welcome to Property Manager CLI."
# puts "Enter '1' to View Apartments"
# puts "Enter '2' to View Tenants"
# puts "Enter '3' to Apartments and Associated Tenants"
# user_input = gets.chomp
#
# def all_apts
#   Apartment.all.map do |apartment|
#     puts "Apartment ID :#{apartment.id}, Address: #{apartment.address}, Monthly Rent: #{apartment.monthly_rent}"
#   end
# end
#
# def all_tenants
#   Tenant.all.map do |tenant|
#     puts "Name: #{tenant.name}, Age: #{tenant.age}"
#   end
# end
#
# # def tenant_apt
# #   Tenant.all.each do |occupy|
# #     puts ""
#
# if user_input == "1"
#   puts all_apts
# end
#
# if user_input == "2"
#   puts all_tenants
# end
#
# # if user_input == "3"
