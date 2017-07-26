require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'


get '/apartments/new' do
  erb :'apartments/new'
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/show"
end


get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end


get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @apartment = Apartment.find(@tenant.apartment_id)
  erb :"tenants/show"
end
