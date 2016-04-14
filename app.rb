require 'bundler/setup'
require 'active_record'
require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

# artists = apartments
# songs - tenants

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end
