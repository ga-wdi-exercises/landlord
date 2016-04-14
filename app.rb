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


get '/tenants' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
