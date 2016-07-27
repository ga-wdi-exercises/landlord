require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Require the connection file
require_relative 'db/connection'

# Require the models
require_relative 'models/apartment'
require_relative 'models/tenant'


get '/' do 
  @apart = '/apartments'
  @tenant = '/tenants'
  erb :'home/index'
end

get '/apartments' do
  @apartment = Apartment.all
  puts Apartment.all
  erb :"/apartments/index"
end

# create new apartment
get '/apartments/create' do
  erb :"apartments/create"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenant = Tenant.where(apartment_id: params[:id])
  erb :"/apartments/apartment_tenants"
end

# Add the new appartment
post '/apartments' do
  apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{apartment.id}"
end

get '/tenants' do 
  @tenant = Tenant.all
  erb :"/tenants/index"
end 

get '/tenant/:id' do 
  @tenant = Tenant.find(params[:id])
  @apartment_id = @tenant.apartment.id
  puts @apartment_id
  @apartment = Apartment.find(@apartment_id)
  erb :"/tenants/show"
end


