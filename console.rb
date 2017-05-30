require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

require 'sinatra'
require 'sinatra/reloader'

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."
# apartment = Apartment.all
# tenant = Tenant.all
# loop do
#   puts "Welcome to Landlord. Please choose the following:"
#   puts "1 - View All Apartments"
#   puts "2 - View All Tenants"
#   puts "3 - All Apartments and tenants"
#   puts "X - Exit"
#   input = gets.chomp
#   if input == "1"
#     apartment.each do |apartment|
#       puts "ID: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: $#{apartment.monthly_rent}"
#     end
#   elsif input == "2"
#     tenant.each do |tenant|
#       puts "Name: #{tenant.name}, Age: #{tenant.age}"
#     end
#   elsif input == "3"
#     apartment.each do |apartment|
#       # puts "-" * 30
#       tenant.each do |tenant|
#         # puts "#{apartment.id} | #{tenant.apartment_id}"
#         if  apartment.id == tenant.apartment_id
#           puts "address: #{apartment.address}, #{tenant.name}"
#         end
#       end
#     end
#   else input.downcase == "x"
#     exit(true)
#   end
# end
#
# binding.pry
#
# puts "ignore this line, it's just here so the binding.pry above works"

@apartments = Apartment.all
@tenant = Tenant.all

get '/' do
  @apartment = 0
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :apartments
end

get '/apartments/1' do
  @apartments = Apartment.all
  # @apartment = params[:apartment].to_i
  erb :apartment_1
end

get '/apartments/tenant' do
  @apartments = Apartment.all
  @tenant = Tenant.all
  erb :tenant
end

get '/new' do
  erb :new_apartment
end
post '/new' do
  @apartments = Apartment.all
  @apartments.push(params[:new_apartment])
  erb :new_apartment
end
