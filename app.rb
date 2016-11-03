require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
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

get '/tenants/new' do
  erb :"tenants/new"
end

get '/apartment/:id/edit' do
  @apt = Apartment.find(params[:id])
  erb :"apartments/edit"
end

get '/apartment/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect '/'
end

post '/apartments' do
  Apartment.create(params[:apartment])
  redirect "/apartments"
end

post '/tenants' do
  Tenant.create(params[:tenant])
  redirect '/'
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect '/'
end
