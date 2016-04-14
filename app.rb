require 'bundler/setup'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.where( apartment_id: params[:id] )
  erb :"apartments/show"
end

get '/apartments/new/' do
  erb :"apartments/new"
end

post '/apartments/new/' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
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

get '/apartments/:id/delete' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/delete"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments/")
end


get '/tenants' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
