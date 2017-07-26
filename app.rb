require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'

get '/directory' do
  erb :"directory"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/listings"
end

get '/apartments/new' do
  erb :"apartments/newapartment"
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
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

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/listings"
end
