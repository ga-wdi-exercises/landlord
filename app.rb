require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/tenant'
require_relative 'models/apartment'

get '/' do
  erb :index
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do
  erb :"tenants/new"
end

post '/tenants' do
  @tenants = Tenant.create(params[:tenant])
  redirect "/tenants"
end

get '/apartments' do
  @apartment = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

post '/apartments' do
 @apartment = Apartment.create(params[:apartment])
 redirect "/apartments/#{@apartment.id}"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end


delete '/apartments/:id' do
 @apartment = Apartment.find(params[:id])
 @apartment.destroy
 redirect "/apartments"
end
