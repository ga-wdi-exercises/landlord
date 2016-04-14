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

get '/apartments/index' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :"apartments/index"
end



get '/tenants/index' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :"tenants/index"
end
