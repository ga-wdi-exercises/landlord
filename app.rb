require 'active_record'
require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :list_all_apartments
end

get '/apartments/new' do
  erb :new_apartment
end

post '/apartments' do
  Apartment.create(params[:apartment])
  redirect "/apartments"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :apartment_info
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :edit_apartment
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments"
end

get '/apartments/:id/tenants' do
  @tenants = Tenant.all
  erb :list_tenants
end

get '/apartments/:id/tenants/new' do
  erb :new_tenant
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end
