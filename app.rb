require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


require_relative 'db/connection'


require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  redirect '/home'
end

get '/home' do
  erb :"home/index"
end

get '/apartments/index' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

get '/tenants/index' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
