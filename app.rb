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
  @current_tenants = Tenant.where(apartment_id: params[:id])
  erb :"apartments/show"
end

get '/apartment/new' do
  erb :"apartments/new"
end

post '/apartments/index' do
  apartment = Apartment.create(params[:apartment])
  redirect '/apartments/index'
end

get '/tenants/index' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do
  erb :"tenants/new"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @current_apartment = Apartment.find(@tenant.apartment_id)
  erb :"tenants/show"
end

post '/tenants/:id' do
  tenant = Tenant.create(params[:tenant])
  redirect '/tenants/index'
end
