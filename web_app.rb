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

get '/tenants' do 
  @tenant = Tenant.all
  erb :"/tenants/index"
end 
