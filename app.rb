require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'pg'

require_relative 'models/apartment'
require_relative 'models/tenant'
require_relative 'db/connection'

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

get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end


get 'apartments/:id/tenants' do
  @tenants = Tenant.find(params[:id])
  erb :"tenants/index"
end

get 'apartments/:id/tenants/new' do
  erb :"tenants/new"
end

post '/apartments' do
  apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{apartment.id}"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end
