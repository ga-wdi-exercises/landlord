
require 'sinatra'
require 'sinatra/reloader'
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end

get '/' do
  erb :homepage
end

get '/apartments/:apartments' do
@apartments = params[Apartment.all]
  erb :apartments
end

#   all_apartment.each do |i|
#     @apartments = all_apartment
#     erb :layout
# end

# get '/apartments/:address/:monthly_rent/:sqft/:num_beds/:num_baths' do
#   all_apartment = Apartment.all
#   all_apartment.each do
#     puts "#{params[:address]} #{params[:monthly_rent]}  #{params[:sqft]} #{params[:num_beds]} #{params[:num_baths]}"
#   end
# end
#
# get '/apartments/new' do
#   address = " "
#   rent = 0
#   sqft = 0
#   num_beds = 0
#   num_baths = 0
#
#   puts "What is your address?"
#   address = gets.chomp
#   puts "How much is your monthly_rent?"
#   monthly_rent = gets.chomp
#   puts "How much sqft is your appartment?"
#   sqft = gets.chomp
#   puts "How many num_beds?"
#   num_beds = gets.chomp
#   puts "How many num_baths?"
#   num_baths = gets.chomp
# end
#
# get '/apartments/1' do
#   all_apartment.sample do |i|
#     all_apartment = Apartment.all
#     puts "#{i[:address]} #{i[:monthly_rent]}  #{i[:sqft]} #{i[:num_beds]} #{i[:num_baths]} "
#   end
# end
#
# get '/apartments/1/tenants' do
#   all_tenants = Tenant.all
#   all_apartment = Apartment.all
#
#   all_tenants = all_apartment.sample
# end
#
# get '/apartments/1/tenants/new' do
#   name = " "
#   age = 0
#   gender = " "
#   apartment_id = 0
#
#   puts "What is your name?"
#   name = gets.chomp
#   puts "What is your age?"
#   age = gets.chomp
#   puts "Your gender?"
#   gender = gets.chomp
#   puts "Your apartment_id?"
#   apartment_id = gets.chomp
# end
