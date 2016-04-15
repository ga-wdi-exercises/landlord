require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
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
  redirect("/apartments/#{@apartment.id}")
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  erb :"apartments/edit"
  redirect('/apartments')
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do
  @apartments = Apartment.all
  erb :"tenants/new"
end

post '/tenants' do
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
