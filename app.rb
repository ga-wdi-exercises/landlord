require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  @apartments = Apartment.all
  erb :"index"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"index"
end

get '/apartments/new' do
  erb :"new"
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"profile"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :'/edit'
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end


get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.all
  erb :profile
end


delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect '/apartments'
end
